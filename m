Return-Path: <linuxppc-dev+bounces-3963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27879EC266
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 03:41:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7KcN4pC0z30DL;
	Wed, 11 Dec 2024 13:41:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733884900;
	cv=none; b=oMQvyW8qOdxSEr0iCdqydqsl+hGuGMwtf94H8hzZNa/6GHZexip9wXOvc6RjM5MxtYg2YVZ9/r2i8THZ0CLqHXlEmQM5WFWFgiHvKnSOK/2b8xTrjgpT4OsThYtDxdxKCvF5oLPaL8STXRmeebVN5TZfOMVg2EteVERZETSoke3EKXsWoAmpth6aETHyhlUrpvZxzVIaRu+4Di7pafY74NM0N5rpu8OcHWnyHsm0AT7vLSD2ci3EzXFWKUcQpuqN2Ud0+9YqsE9o+dvJHw2szh0f3D5naloepiWFDsSY3qBnIzEog5+ucETJwOwd0oDyFmTk/zZ8MJURb0rEle/NOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733884900; c=relaxed/relaxed;
	bh=7CBb7hjH4xh1oj/7iU6E/LdGW+K5cpcHxcxXfa7bm7I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nwtSmKDg/NpLGcfahBwiaw54+7qbQiZmEQmwKD53iSbDFGuZstNnj5nTK6sOADSXtVqELKb40pStoBXWd1FsCNa65DStt+4E0JcWvmqmTvHXWTAEjNB0EiIHsCz27AhAxRM3TfcCmK3l3Kw5cF+wTye5zSLcAGL7IImui9QoEqfMfmfRsP3P6OwU93DbtQk3DGmFYCkLoLHFzSfuddPnYcS+No5ldq5x0XS2RAHn96awyc/vkgikGWdQUP7VH/69aFBM6rO8kKShsUN7LAxuLHST+K4sOSjjG6RyWoviKwSuOCC377XohHyBRKLXJ5i6yIpKmjcdCYL56gU1DcKI8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Da4qREKh; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Da4qREKh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7KcL4q1Nz305n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 13:41:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B6E7A41D8D;
	Wed, 11 Dec 2024 02:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2728C4CED6;
	Wed, 11 Dec 2024 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733884894;
	bh=00K8MMiI4zi+Ut/RW/eta+vMQomu0Giei3szpffQQOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Da4qREKhLmCm8yz23HYMcnYhvUPIhwEMSq3e2xy5eHqmd+lk3xFCqCL8gMV2d1qZM
	 OX/nYhIL+8FVEAH5j2G8jreOCn4t5aDyk2A67ZSa2Mkyc9Pdlwt9HWePiQrPKYupQD
	 HqnoKIQmX31F4DdpsyABbQ15F6Ui5dY/VyDtBpBstL8y1jhriA+kdAfBMPTAXFbWnS
	 63C0vjQwg5Lmz+BJiiuG775DcGC4erU4pOGbFjbFCfGrajmvqQlFUpggTSjU+aLgVs
	 HKqzofl4MBLxzwaLLU/QjjetYigVK4WMW1awwyb5uskvci+1KuE5L5PLpPOgzSWNQz
	 YP2aWNyh8AjbA==
Date: Tue, 10 Dec 2024 18:41:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?UTF-8?B?TW9ubsOp?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel
 Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, Ilya
 Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Peens
 <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
Message-ID: <20241210184129.41aaf371@kernel.org>
In-Reply-To: <20241210183130.81111d05148c41278a299aad@linux-foundation.org>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
	<315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
	<20241210153604.cf99699f264f12740ffce5c7@linux-foundation.org>
	<20241210173548.5d32efe0@kernel.org>
	<20241210183130.81111d05148c41278a299aad@linux-foundation.org>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 10 Dec 2024 18:31:30 -0800 Andrew Morton wrote:
> > > I'll just grab everything and see if anyone complains ;)  
> > 
> > I may, if this leads to a conflict :(  
> 
> Very unlikely, and any such conflict will be trivial.

Agreed, mainly I don't understand why we'd make an exception
and take the patchset via a special tree.

> > Easwar, please break this up per subsystem.  
> 
> The series is already one-patch-per-changed-file.

More confusingly still, they did send one standalone patch for 
an Ethernet driver:
https://lore.kernel.org/all/20241210-converge-secs-to-jiffies-v3-20-59479891e658@linux.microsoft.com/
And yet another Ethernet driver (drivers/net/ethernet/google/gve/) 
is converted in this series.

