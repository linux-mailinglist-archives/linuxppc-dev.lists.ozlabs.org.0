Return-Path: <linuxppc-dev+bounces-3974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7329EC410
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 05:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7N7W0hxZz3054;
	Wed, 11 Dec 2024 15:35:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733891719;
	cv=none; b=JoNc3I39BQJRlYkMrVLQ3SIMgUrc5V+S4ob8PoaoaW2DcWHx8y5nILoDhHm16tOlhe5drpWUIVxcI5V8tZIyP+aun8/Rd40WU3q3OF8wseC/DTkQrfr5FzSlDfjq+lLAAWGOzL+Jkzt91vjNrE+UMvB8usXnLxq2jyMgyZQqgsqaTMCQlOSv3LiPqGhA15LktFeTwnGmwOOE7ZcNxPxCJFxTjqEFr1bytzUZNZbHZ3A/GMowg+ZgwHZh8erm+S1ewdHjO0JfmwMCBJPU7t/ctMvv43L9ZJLQ94bRPkMuCNPi8Y6RQmxaCW9cjkcn9ymzH8Qfc8dx9Ouf6LmqZbMQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733891719; c=relaxed/relaxed;
	bh=SKADluaoUiTETH1UwG/V5DVCwgNdNCuMvx/YiXR3rAc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X6YDx46qKTZhD7dCC4hWC8QGGM97fAAY9wNCY0wMo3RwKYNqHNTPdFHL7478fFDzX3qaFx4fJ8LIzxQFzQgDJlDCmeQB/aNGXGom3pT2FIH8L4GqrlcAAQlvGzGKYWS3osy48XHGMg/n+f7/0J4xoBtprA4yj6fXcd2kAgsgMF7rIKYySV329Yn+4Y5xnlu57aGNRiosz0kUo5teuHjiuG16qhinUK4zlX+qYwbmAqTXGgrclCEoUde6ETwi22Joucx7KM7PFeUl3KuaZWh4mYfsSMrNoytc8soYxT4pIm00iTZQFbFMPhQkPU1BHRw4UAhEv5VTXFImJnMjd1RcQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=IJPud503; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=IJPud503;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7N7T6r1zz304H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:35:17 +1100 (AEDT)
Received: from [100.65.208.14] (unknown [20.236.11.185])
	by linux.microsoft.com (Postfix) with ESMTPSA id C44BD204722B;
	Tue, 10 Dec 2024 20:34:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C44BD204722B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733891686;
	bh=SKADluaoUiTETH1UwG/V5DVCwgNdNCuMvx/YiXR3rAc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=IJPud503TZQ7qC+nAh33r29ZAguv/DZaDYDmYDAbJHqsXv7vFEisx4C+2Bx4/X0Ny
	 QNmGT6WWiLLDSDyIxMX24BlKcPvLa2DRjFmS0GhpoB9JmvKOYeEniEHPcKfYI5Rx3Y
	 UFvay1FmNXEMmTdeKu7+xEJKV27TsW4+ndYHIugA=
Message-ID: <d93e388c-ed18-400c-b6cf-ec00a5979457@linux.microsoft.com>
Date: Tue, 10 Dec 2024 20:34:43 -0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Andrew Morton <akpm@linux-foundation.org>, eahariha@linux.microsoft.com,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
To: Jakub Kicinski <kuba@kernel.org>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
 <20241210153604.cf99699f264f12740ffce5c7@linux-foundation.org>
 <20241210173548.5d32efe0@kernel.org>
 <20241210183130.81111d05148c41278a299aad@linux-foundation.org>
 <20241210184129.41aaf371@kernel.org>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20241210184129.41aaf371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/2024 6:41 PM, Jakub Kicinski wrote:
> On Tue, 10 Dec 2024 18:31:30 -0800 Andrew Morton wrote:
>>>> I'll just grab everything and see if anyone complains ;)  
>>>
>>> I may, if this leads to a conflict :(  
>>
>> Very unlikely, and any such conflict will be trivial.
> 
> Agreed, mainly I don't understand why we'd make an exception
> and take the patchset via a special tree.
> 
>>> Easwar, please break this up per subsystem.  
>>
>> The series is already one-patch-per-changed-file.
> 
> More confusingly still, they did send one standalone patch for 
> an Ethernet driver:
> https://lore.kernel.org/all/20241210-converge-secs-to-jiffies-v3-20-59479891e658@linux.microsoft.com/
> And yet another Ethernet driver (drivers/net/ethernet/google/gve/) 
> is converted in this series.

Sorry about the confusion, I missed pulling the gve patch from this
series. I'll send that (and ath11k) separately as well. I'll pull all
these together into a series so you can merge them together if you prefer.

Thanks,
Easwar

