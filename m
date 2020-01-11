Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 770E0138182
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 15:18:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47w25364RMzDqjk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2020 01:18:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=alexandre@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47w23H0xfmzDqgG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2020 01:16:41 +1100 (AEDT)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 400063A9EDA
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 14:06:34 +0000 (UTC)
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.12] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alexandre@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EE08540002;
 Sat, 11 Jan 2020 14:06:00 +0000 (UTC)
Subject: Re: linux-next: build warning after merge of the bpf-next tree
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <20191018105657.4584ec67@canb.auug.org.au>
 <20191028110257.6d6dba6e@canb.auug.org.au>
 <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
 <CAADnVQLo5HEjTpTTRm=BtExuKifPtCJm+Hu_WP6yeyV-Er55Qg@mail.gmail.com>
From: Alexandre Ghiti <alexandre@ghiti.fr>
Message-ID: <3e6f298c-e428-fdee-47a8-14addc581501@ghiti.fr>
Date: Sat, 11 Jan 2020 09:06:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAADnVQLo5HEjTpTTRm=BtExuKifPtCJm+Hu_WP6yeyV-Er55Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, zong.li@sifive.com,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 1/10/20 6:18 PM, Alexei Starovoitov wrote:
> On Fri, Jan 10, 2020 at 2:28 PM Alexandre Ghiti <alexandre@ghiti.fr> wrote:
>> Hi guys,
>>
>> On 10/27/19 8:02 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> On Fri, 18 Oct 2019 10:56:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>> Hi all,
>>>>
>>>> After merging the bpf-next tree, today's linux-next build (powerpc
>>>> ppc64_defconfig) produced this warning:
>>>>
>>>> WARNING: 2 bad relocations
>>>> c000000001998a48 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
>>>> c000000001998a50 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end
>>>>
>>>> Introduced by commit
>>>>
>>>>     8580ac9404f6 ("bpf: Process in-kernel BTF")
>>> This warning now appears in the net-next tree build.
>>>
>>>
>> I bump that thread up because Zong also noticed that 2 new relocations for
>> those symbols appeared in my riscv relocatable kernel branch following
>> that commit.
>>
>> I also noticed 2 new relocations R_AARCH64_ABS64 appearing in arm64 kernel.
>>
>> Those 2 weak undefined symbols have existed since commit
>> 341dfcf8d78e ("btf: expose BTF info through sysfs") but this is the fact
>> to declare those symbols into btf.c that produced those relocations.
>>
>> I'm not sure what this all means, but this is not something I expected
>> for riscv for
>> a kernel linked with -shared/-fpie. Maybe should we just leave them to
>> zero ?
>>
>> I think that deserves a deeper look if someone understands all this
>> better than I do.
> Are you saying there is a warning for arm64 as well?


Nop.


> Can ppc folks explain the above warning?
> What does it mean "2 bad relocations"?


This is what I'd like to understand too, it is not clear in
the ppc tool that outputs this message why it is considered 'bad'.


> The code is doing:
> extern char __weak _binary__btf_vmlinux_bin_start[];
> extern char __weak _binary__btf_vmlinux_bin_end[];
> Since they are weak they should be zero when not defined.
> What's the issue?


There likely is no issue, I just want to make sure those relocations
are legitimate and I want to understand what we should do with those.

At the moment arm64 does not relocate those at runtime and purely
ignore them: is this the right thing to do ?


