Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431904B503C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 13:34:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy3Yj5prDz3cTX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 23:34:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy3YD43F7z30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 23:33:33 +1100 (AEDT)
Received: from [192.168.0.7] (ip5f5aebfe.dynamic.kabel-deutschland.de
 [95.90.235.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D20BD61EA1927;
 Mon, 14 Feb 2022 13:33:24 +0100 (CET)
Message-ID: <e6701fa9-a51b-3706-5aa5-bb6c7ae76cf0@molgen.mpg.de>
Date: Mon, 14 Feb 2022 13:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: No Linux logs when doing `ppc64_cpu --smt=off/8`
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <d141d8c3-5c72-02ab-6b31-c32cd02f8291@molgen.mpg.de>
 <20220214094327.GL3113@kunlun.suse.cz>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220214094327.GL3113@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Michal,


Thank you for your reply.

Am 14.02.22 um 10:43 schrieb Michal Suchánek:

> On Mon, Feb 14, 2022 at 07:08:07AM +0100, Paul Menzel wrote:
>> Dear PPC folks,
>>
>>
>> On the POWER8 server IBM S822LC running `ppc64_cpu --smt=off` or `ppc64_cpu
>> --smt=8`, Linux 5.17-rc4 does not log anything. I would have expected a
>> message about the change in number of processing units.
> 
> IIRC it was considered too noisy for systems with many CPUs and the
> message was dropped. You can always check the resulting state with
> ppc64_cpu or examining sysfs.

Yes, simple `nproc` suffice, but I was more thinking about, that the 
Linux log is often used for debugging and the changes of amount of 
processing units might be good to have. `ppc64_cpu --smt=off` or `=8` 
seems to block for quite some time, and each thread/processing unit 
seems to powered down/on sequentially, so it takes quite some time and 
it blocks. So 140 messages would indeed be quite noise. No idea how 
`ppc64_cpu` works, and if it could log a message at the beginning and end.


Kind regards,

Paul
