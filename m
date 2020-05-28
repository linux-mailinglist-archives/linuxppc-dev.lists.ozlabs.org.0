Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8861E660E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 17:29:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xs7T72bjzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 01:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iogearbox.net
X-Greylist: delayed 1045 seconds by postgrey-1.36 at bilbo;
 Fri, 29 May 2020 01:24:15 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xs1W6nHkzDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 01:24:15 +1000 (AEST)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1jeK75-0001th-BD; Thu, 28 May 2020 17:06:31 +0200
Received: from [178.196.57.75] (helo=pc-9.home)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1jeK74-000Ei1-Ul; Thu, 28 May 2020 17:06:30 +0200
Subject: Re: [PATCH] powerpc/bpf: Enable bpf_probe_read{, str}() on powerpc
 again
To: Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>
References: <20200527122844.19524-1-pmladek@suse.com>
 <87ftbkkh00.fsf@mpe.ellerman.id.au> <20200528091351.GE3529@linux-b0ei>
 <87d06ojlib.fsf@mpe.ellerman.id.au>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <aace2e9e-c63c-a1a2-a1e1-c7a46904e8c5@iogearbox.net>
Date: Thu, 28 May 2020 17:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87d06ojlib.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.2/25826/Thu May 28 14:33:30 2020)
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
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Brendan Gregg <brendan.d.gregg@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/28/20 2:23 PM, Michael Ellerman wrote:
> Petr Mladek <pmladek@suse.com> writes:
>> On Thu 2020-05-28 11:03:43, Michael Ellerman wrote:
>>> Petr Mladek <pmladek@suse.com> writes:
>>>> The commit 0ebeea8ca8a4d1d453a ("bpf: Restrict bpf_probe_read{, str}() only
>>>> to archs where they work") caused that bpf_probe_read{, str}() functions
>>>> were not longer available on architectures where the same logical address
>>>> might have different content in kernel and user memory mapping. These
>>>> architectures should use probe_read_{user,kernel}_str helpers.
>>>>
>>>> For backward compatibility, the problematic functions are still available
>>>> on architectures where the user and kernel address spaces are not
>>>> overlapping. This is defined CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE.
>>>>
>>>> At the moment, these backward compatible functions are enabled only
>>>> on x86_64, arm, and arm64. Let's do it also on powerpc that has
>>>> the non overlapping address space as well.
>>>>
>>>> Signed-off-by: Petr Mladek <pmladek@suse.com>
>>>
>>> This seems like it should have a Fixes: tag and go into v5.7?
>>
>> Good point:
>>
>> Fixes: commit 0ebeea8ca8a4d1d4 ("bpf: Restrict bpf_probe_read{, str}() only to archs where they work")
>>
>> And yes, it should ideally go into v5.7 either directly or via stable.
>>
>> Should I resend the patch with Fixes and
>> Cc: stable@vger.kernel.org #v45.7 lines, please?
> 
> If it goes into v5.7 then it doesn't need a Cc: stable, and I guess a
> Fixes: tag is nice to have but not so important as it already mentions
> the commit that caused the problem. So a resend probably isn't
> necessary.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> Daniel can you pick this up, or should I?

Yeah I'll take it into bpf tree for v5.7.

Thanks everyone,
Daniel
