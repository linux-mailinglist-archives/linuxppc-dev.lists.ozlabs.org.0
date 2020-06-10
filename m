Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8152F1F53A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlSd65h7zDqDm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.24;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=I6b2njdZ; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hl3t4GcmzDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 21:23:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591788210;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ppHyWkO8AGokDFVTFfSR/y0B8VZdaapRRYZ1XbHFeWo=;
 b=I6b2njdZyvO9P4sFbyqIKqX6KPaSrq3hLtE+Jdt7sSHxz+BCuBDV4OG1xceXLAqoSQ
 DRXG7NTIJ4Tu2pUcXEyCGIQ32JYRXHdMROvVn8UWteCdWl/wDsdNwk/zFJSWF5d47yYa
 0OZ88P8m/9BEmxSGPKffBZ9/C7jGeLBbiqRCys4xU5B0en3jmGT3HY3QyqIx0VDaDRSz
 aw8jkmeL5Jn4Jh+ulO2UFQE0ZLDcgbiSTUufsmnb/qj8lz2stSmWBOMk4RwLZxCUcO0j
 xn6ugdruG9Su3tvLg+dq/oYB77Fr1zC+EeptArGICuw8xWjnxiqnbL1DjgpAlzGKXL93
 5V+Q==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.9.1 AUTH) with ESMTPSA id w06ffew5ABNSZgw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 Jun 2020 13:23:28 +0200 (CEST)
Subject: Re: PowerPC KVM-PR issue
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Graf <agraf@suse.de>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
 <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
 <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
 <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
 <87tuznq89p.fsf@linux.ibm.com>
 <f2706f5f-62b8-9c52-08f4-59f91da48fa6@xenosoft.de>
 <cf99a8c0-3bad-d089-de54-e02d3dba7f72@xenosoft.de>
Message-ID: <7e859f68-9455-f98f-1fa3-071619fa1731@xenosoft.de>
Date: Wed, 10 Jun 2020 13:23:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cf99a8c0-3bad-d089-de54-e02d3dba7f72@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10 June 2020 at 11:06 am, Christian Zigotzky wrote:
> On 10 June 2020 at 00:18 am, Christian Zigotzky wrote:
>> Hello,
>>
>> KVM-PR doesn't work anymore on my Nemo board [1]. I figured out that 
>> the Git kernels and the kernel 5.7 are affected.
>>
>> Error message: Fienix kernel: kvmppc_exit_pr_progint: emulation at 
>> 700 failed (00000000)
>>
>> I can boot virtual QEMU PowerPC machines with KVM-PR with the kernel 
>> 5.6 without any problems on my Nemo board.
>>
>> I tested it with QEMU 2.5.0 and QEMU 5.0.0 today.
>>
>> Could you please check KVM-PR on your PowerPC machine?
>>
>> Thanks,
>> Christian
>>
>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>
> I figured out that the PowerPC updates 5.7-1 [1] are responsible for 
> the KVM-PR issue. Please test KVM-PR on your PowerPC machines and 
> check the PowerPC updates 5.7-1 [1].
>
> Thanks
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d38c07afc356ddebaa3ed8ecb3f553340e05c969
>
>
I tested the latest Git kernel with Mac-on-Linux/KVM-PR today. 
Unfortunately I can't use KVM-PR with MoL anymore because of this issue 
(see screenshots [1]). Please check the PowerPC updates 5.7-1.

Thanks

[1]
- 
https://i.pinimg.com/originals/0c/b3/64/0cb364a40241fa2b7f297d4272bbb8b7.png
- 
https://i.pinimg.com/originals/9a/61/d1/9a61d170b1c9f514f7a78a3014ffd18f.png

