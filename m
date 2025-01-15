Return-Path: <linuxppc-dev+bounces-5271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE6A117F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 04:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXsGq42mtz3bPM;
	Wed, 15 Jan 2025 14:41:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736912467;
	cv=none; b=khoP0gwO0/Xg5csk5bIuAAPmIufuOiQO+RuUUFBbAdrmUb+3dbOVjxUnSjCeJanWdPY24DGaXS1C90C43oARQJduJsReiBSBu5vYOWg6WUrtLZRdTzm/ObPiHSncpyJcsQEp+T2wj/J3T6eUa84srm2QAiZ5mC80DHR6SLc7FMml3bnWb/UfeIzP9qCvEJPOi6wEo8yv2FIvctcZdNvls/P8TOakv9UHYhVMDB46J/RgZThkgyOHt5pmcD5s5VO+VYa6+eH4OlgHmXF9h8nU1UmyOv2qo/1Kc/1JD9QkYO4zK2YgvVNBagNCfzpG9ERSxkkZLeidQ10YZpOEzZEuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736912467; c=relaxed/relaxed;
	bh=UmTK2k4vF2mqctoCssOfytU8KQ/2i1ya8c1dPxSZwZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBwFccGzYz6AgWBuPXEeBepttKl3MNIQvH0iC4iYXcHPUc+BBLQTTlWDciEbtJLoZbMkGaFs9i2xssOY1kg0jgigif1+zAFI4qx6aGE/aBriAtcPwf4vGcPNU7tZvSP7k3g3Ux17hdD8hdHu6qM7f8odwM/WNInLyM3YmiSQRtqAvXw0JLfNjUnWg+uDyahZsbASlhD1Lw5+uR5HKyxkKwnD+erkFxsxgYaMQrsQPHnJzVkap+hnAYlKksg0v2R3DvQwHdDt5VLzATsu1nEozTTVbhIKBMrACceLfs4hABlulv+wTL1sq/HyY/Cn1ai3ZdX8lDQT+xUSAKn4t3gNTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rnmyr4uH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rnmyr4uH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXsGp5wJBz30g1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 14:41:06 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso11148568276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 19:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912464; x=1737517264; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmTK2k4vF2mqctoCssOfytU8KQ/2i1ya8c1dPxSZwZk=;
        b=Rnmyr4uH4jLUi+2Xa91KabZeEDhH+HNCo6jTPIx98SiOcuQ08etQ53BkGLJ9hzZINF
         7EpaIhbFnxnMuXEal2sT3kH/RHBL9Nc7/Mn7G5dY31QRvgCNnlIVcgmr4l7If2b1Lipj
         Dhx5tmXkZUj3qcQiWsylXl+5jUmGRtNdM66pVGvzW+9ZhvDQ7B83yGFIax6ENMp7C7ZE
         hhneiDh1GBc6p/5vL54EGZv/wzU2yGfhjo27e5jYZ56gLUznlTnnWAtRVSEvJzEbzuCN
         /mRyZWMOx9H4b7JO1r42rFN8rdB0z+ONTjoT4JU9UrmhqCwQjWBsgod53vRB7RIf+ZCU
         QSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912464; x=1737517264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmTK2k4vF2mqctoCssOfytU8KQ/2i1ya8c1dPxSZwZk=;
        b=re85aw+cJzFfDVZqYKdyammV2IhNZvyHV5q6n5md6nfWAcHYlm9oYC9y473rl1voB0
         hrAlASNcyEwQwwZl/Ctm0m8WinssqZ24NZrN9yIOQpJHTVTyvrf3hMW3DoD3QSqbAdNI
         puDVH9yPyxp2JHQGK1zjOTCXGjKwUAK4YJ1vfR1r51UZxkgyyYVhj01gEE4ZsAQgYVqg
         7aj3FoEqkqpvhO6zR2syvwiuAStxqblvzcakLPCwK/YcIgDS8zZL5H/M7DbL7REszyfj
         s7xl7p9zjLnWIxSrk5tnIegCpm8gEjTA3vlALr3/Nz8OUFsRrbNiRAcdo5ZlfFFvEgLU
         9xPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBkTviAFucBt0wcovPhWqOWpIK4EmRKgArYOe284D2A8BHAm+P1yqsx0wWoVBjPqoZ+THB5XfxNdwBGEU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUwOLtNghEXt9idSoJyLUPlO/Pi8h3gVspgidrlkrTmFVjVMv+
	/XfOo8YV6CrLT5cjeXOPTQYjLkt/bdByVU4z7+N/MQxHWmmsNAUQ
X-Gm-Gg: ASbGncsx44wS2dmBVw8GTh1eGJGG7vr8p6LqZqoLyh431YlaRuKV2p7lEW8T5UwID8p
	yO3Y4yNP829KVz/6JrVvApQv7gHvZcf/1W+xKQEk8w0I8MZD0LDUZMa7Wgzd6hAijI+eAb0suBb
	GE7+nhHLKW3xB1oiTWisgbeDmlyHLAXGWJ6EBgWFjOG2KaKmES+/eks5mD3lHx0/kol8Rh5Ibaz
	qfzP8loIksEc2RqrXI3aG+XvzcA/Y1y/9V+kcKs58tBED+I68cMiHyd
X-Google-Smtp-Source: AGHT+IGlCnPNZfANCVJooif/vwR9Wcfdn14fNs9Squ/CXSzhwHBTvNfC1cp1ga3/es5eAiOB92QKfQ==
X-Received: by 2002:a05:690c:45c9:b0:6f6:cad6:6b5a with SMTP id 00721157ae682-6f6cad66c84mr8171767b3.13.1736912464441;
        Tue, 14 Jan 2025 19:41:04 -0800 (PST)
Received: from localhost ([2601:347:100:5ea0:e12f:d330:c8d6:a6b7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6c93732c9sm1796417b3.103.2025.01.14.19.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:41:03 -0800 (PST)
Date: Tue, 14 Jan 2025 22:41:02 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
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
Subject: Re: [PATCH 06/14] cpumask: re-introduce cpumask_next{,_and}_wrap()
Message-ID: <Z4cuTsHbO6yiuFKA@thinkpad>
References: <20241228184949.31582-7-yury.norov@gmail.com>
 <20250103174432.GA4182129@bhelgaas>
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
In-Reply-To: <20250103174432.GA4182129@bhelgaas>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 03, 2025 at 11:44:32AM -0600, Bjorn Helgaas wrote:
> On Sat, Dec 28, 2024 at 10:49:38AM -0800, Yury Norov wrote:
> > cpumask_next_wrap_old() has two additional parameters, comparing to it's
> > analogue in linux/find.h find_next_bit_wrap(). The reason for that is
> > historical.
> 
> s/it's/its/
> 
> Personally I think cscope/tags/git grep make "find_next_bit_wrap()"
> enough even without mentioning "linux/find.h".
> 
> > + * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
> > + *			   @n and wrapping around, if needed
> > + * @n: the cpu prior to the place to search (i.e. return will be > @n)
> 
> Is the return really > @n if it wraps?

No, this is a copy-paste error. Will fix in v2.

Thanks,
Yury

