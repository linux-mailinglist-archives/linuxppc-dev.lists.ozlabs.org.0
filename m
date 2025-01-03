Return-Path: <linuxppc-dev+bounces-4639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BECA00B57
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 16:21:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPnNh0lBjz30T0;
	Sat,  4 Jan 2025 02:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735917700;
	cv=none; b=gInQNmPZHP0VAIqRvOQQL5fb1Lfyd7u0JZzh2PN8cyzztfvZkPzRdGszmlJlOUefKDVDabj0Gbqr5ELyBsDaRJghfAyD9jxuY+tz0oMjzBfsLTQr8G4VXZSln/QqDbX6jU6LcKc/1h3gMlwteMtrecR760ESo4YKDvvGPwh2eDxsftfSvMEN60LAIAc0WE9RF5MAEWRCz1sSsq8oE2WsvbwuSxLHuet/TNpJep3rdlL9MW92suA2RXHlfPDKIEXrV7HOw/eW0ypcZQVm8mHixFA3TfMYepDXzQJlzOuirSzDXNigkaFrAPX9/r6NlNqriQIRpQFJVs6OUsIs3ccPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735917700; c=relaxed/relaxed;
	bh=lf/9EHK0+H3LQnblB2A3eP443gcgVGZGGzaT7TX3muU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeTLLYw+YF6PREpLL2TuHMtcbUPEoNraMEzLer/mQ10sbRZDl8ooP7d+zCrCTE0wT8mjCq8mTPb1htgr8IS36NO6xBsv/wJSSfB82E1TVA2kxqB7Kn5m6bFbCx2i8Qlfy1g5qUhURUuHzJc/5ZkxQlNlPx97U4nJN0zvhECk0fy5vHS/uj+u1xhvSfbUvLcrLzpZlGCJ7344rnrjQLOlhzZ0VYwOYAUfDxLZVArf5iOOU1vDoaiXA1O0QfyT62Zxy/HfASCrHH4WbBJpajaEvQ+dTNoMe7naM5gqcCYWdhhP+JnWgyAl6b7UmoW0hZFingmLZurfEdpdt5tMiKIN2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q0VZUihF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q0VZUihF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPnNf2q3Xz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 02:21:37 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2166651f752so200187725ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735917691; x=1736522491; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lf/9EHK0+H3LQnblB2A3eP443gcgVGZGGzaT7TX3muU=;
        b=Q0VZUihFyJ3imLtNwsjHRGSEeerXy93/cvdXgX6GlMcLJTSbkNU8ofepXyoY5ucTYO
         rv4/I8YjsKBSsLJzuwuzIwLqF/znrIxeCQ4A/R5j8PHxXeec9ZVV9H3i0zNz7tm2PNfJ
         GJXFAFUw4ey4G7gS24gh3+zENpQRSbfOHy83Zq2TYtSy3XX+MfyoUbpb4LFXkR62vsSJ
         8nrFDXPDBaLkIsQlz5BCNBUCv83OqfPoYEdezdWytzP6G897sqWHKQ7LJVlIxoDeC9u7
         NUSTxpZ6LsSSj4+LqaaIfncJicrfXNUT8ocft0mWYYzvClADpD3wosKtiMyeVpR5GGB9
         MF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735917691; x=1736522491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf/9EHK0+H3LQnblB2A3eP443gcgVGZGGzaT7TX3muU=;
        b=HyXWV3Wv5XZhS1+IY387a7Cp9M/QS8MrmKJHCmToVKeCb0zDjwcFPdesBYxNDV1zLt
         v9oywuwXpBXQLXcP1gTN2lWzp7aWRNQOCTtTaRCIm8We7ZRedKALviwOpgK2x9IKnbWR
         /5gb4bVwcU20alzkV49FV6BGRneqq/8gb7uHJ4570WiU4Uxb9INneGrLQkHtYRsIiCEY
         vr+Tn8wGCHuOlbaFWN2VUxpWk8LqAAJ3LGmJ/5KpuUu8hw6COCMjYkjbK0A642ypSOlN
         qcUsaVnTJP7qAis74SVQimJLqEStFr4MEzIq7ygPsEcAvJ3wKTRbYfyHGYOnEhxZhzSA
         ePlw==
X-Forwarded-Encrypted: i=1; AJvYcCV6P2ZERQAoL8ekCtV0UySyy/4tzVOwTgc1DatL7teKOIqGpN7P9ElzldhlcFs+Bg9XUvSxoMHjtIneUJo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJb0oGifKUa+0/+2bmurX+7nvWDmKERSuC7fHQMuOWB2KTkpSb
	nZl/BhXsgAZcDJkyxvDMiSpevodyyblxVNjkkmLjRFxqjI2N4f4W
X-Gm-Gg: ASbGncv/A/2bfJix5b2pi4DNwt1HhYkwjfYN39dGP88oCXl3V3NDqURXPEA8pwTiswf
	SrwvOKGxxMKex9r+/yv14/+oNTbSC0y8CpsjKGIhJ+T038hCoayuPPE94v4VhvAXO+bwbXSksaf
	VLNrJObAUUuk1nkNltBrUbje+4WeDRJ5qIc/QYnDFUsbTP+/dXSXRo5RiN5Sg9hamnMi1PRW6nW
	cMEgsDqxES/Sft5Mf9yuJ82e4TPxP9qSmq4xzw2AiMQFCB711ppPiBxodJikDSm6XZw9hEgVUxI
	5ZgT
X-Google-Smtp-Source: AGHT+IG5A276qFKzsq0vRtD6GevOEebgjRTwKom2lvuNWUTRxP4Uq5vYQN1tUnp8ZXMDpu322FblbQ==
X-Received: by 2002:a05:6a21:3a85:b0:1e0:c77c:450d with SMTP id adf61e73a8af0-1e5e044ddfamr75802412637.1.1735917690845;
        Fri, 03 Jan 2025 07:21:30 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b1ce01d3sm23948804a12.23.2025.01.03.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:21:30 -0800 (PST)
Date: Fri, 3 Jan 2025 07:21:27 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 00/14] cpumask: cleanup cpumask_next_wrap()
 implementation and usage
Message-ID: <Z3gAdy7nU_-DAxhq@yury-ThinkPad>
References: <20241228184949.31582-1-yury.norov@gmail.com>
 <20250103070229.GC28303@lst.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103070229.GC28303@lst.de>
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 03, 2025 at 08:02:29AM +0100, Christoph Hellwig wrote:
> You've sent me less than a handfull of 14 patches, there's no way
> to properly review this.

Hi Christoph,

You can find the whole series here:

https://lore.kernel.org/linux-scsi/CABPRKS-uqfJmDp5pS+hSnvzggdMv0bNawpsVNpY4aU4V+UdR7Q@mail.gmail.com/T/

Or you can download it by message ID like this:

b4 mbox 20241228184949.31582-1-yury.norov@gmail.com

Sorry for not CC-ing you to the whole series. Some people prefer to
receive minimal noise, and you never know who is who. If it comes to
v2, you'll be in CC for every patch.

Thanks,
Yury

