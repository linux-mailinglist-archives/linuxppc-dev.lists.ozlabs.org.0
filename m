Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9B13FB1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:10:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zGzz6lxQzDqft
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zFGf4tYJzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 06:52:40 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 251063AA222
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 19:49:52 +0000 (UTC)
Received: from [192.168.0.12] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DC94C240002;
 Thu, 16 Jan 2020 19:49:19 +0000 (UTC)
Subject: Re: [PATCH] powerpc: Do not consider weak unresolved symbol
 relocations as bad
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20200115204648.7179-1-alex@ghiti.fr>
 <20200116103932.2e603cf9@canb.auug.org.au>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <ed319b1f-c6f4-7bad-f946-6c01fb202c7c@ghiti.fr>
Date: Thu, 16 Jan 2020 14:49:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116103932.2e603cf9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On 1/15/20 6:39 PM, Stephen Rothwell wrote:
> Hi Alexandre,
>
> Thanks for sorting this out.  Just a few comments below.
>
> On Wed, 15 Jan 2020 15:46:48 -0500 Alexandre Ghiti <alex@ghiti.fr> wrote:
>>   
>>   # Have Kbuild supply the path to objdump so we handle cross compilation.
>                                              ^
> "and nm"
>
>> +# Remove from the bad relocations those that match an undefined weak symbol
>> +# which will result in an absolute relocation to 0.
>> +# Weak unresolved symbols are of that form in nm output:
>> +# "                  w _binary__btf_vmlinux_bin_end"
>> +undef_weak_symbols=$($nm "$vmlinux" | awk -e '$1 ~ /w/ { print $2 }')
>> +
>> +while IFS= read -r weak_symbol; do
>> +	bad_relocs="$(echo -n "$bad_relocs" | sed "/$weak_symbol/d")"
>> +done <<< "$undef_weak_symbols"
> This is not a bash script, and the above is a bashism :-(
> Also, my version of awk (mawk) doesn't have a -e option.
>
> How about something like :
>
> undef_weak_symbols=$($nm "$vmlinux" | awk '$1 ~ /w/ { print $2 }')
> if [ "$undef_weak_symbols" ]; then
> 	bad_relocs="$(echo "$bad_relocs" | grep -F -w -v "$undef_weak_symbols")"
> fi
>
> Or do this near the top and add the grep to the others.

Yes that's quite better, thanks, I'll send a new version tomorrow.

Thanks again,

Alex

