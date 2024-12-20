Return-Path: <linuxppc-dev+bounces-4356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5339F97EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 18:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFDrf633yz30WB;
	Sat, 21 Dec 2024 04:27:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734715666;
	cv=none; b=QQFAqSt1PNJCD3UHh1hFKL1JCVqguzvOSVxOa0FoAmt8H8Cchk1O90ncyCRqf7U0S4aeNKdSDVpvMtvPFiRLjZVpWZA2NBSHshZYulSrQ17qv3RFqyb4Lb++13sRU5ryJ9Gthqhx8X2LVDEbqDF0L9TC3SzsTQKkDbHnBkOLE0ikjGVUix46GPcPBM2TjTjGkjRod3the5xoQhY+4Gt0sdlmfdAkgLoY5smlDSymoujKhkRT42sjyaCItI/189QI01WdrN9Dt6AGOtNQtNDqQv79+R6z6LXa3q68si8rtbkESnyexkSIAzccaOfYHneAzCYhkvXeC7FMps3hoy/MVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734715666; c=relaxed/relaxed;
	bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N8E+9HnBJEFEN7du43AO7XDLGdd4kPndJIXPzlrvega8Ro/NBGFMyPqby+TjdqAz4Xl0h/wVpKHsOR3jFfDknWpm1jpKaaj8Q1g66AzCfe8kkmdpkun1QurvOJ9tL5zxqfcj4OIOIURq1UWupuh9Zm5r7l7fnaXyJQ8TMl3ti8zUgmeEr0ikBtl98WIBTcW+RS9Pl+pxNPpPXqbjznD6jbjstXAJvYci3MwOpfOHX+nrtPGnZY5Grumv9Pr9cPCuzc9BCSutB496xHlG9TlraGR4jcclhxZGzSDRBhM8h2J4kj3HmKj5QvJw9Ft/zRUEVi5JMncFufs2DCLALstFCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zBJzAK2j; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=srinivas.kandagatla@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zBJzAK2j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=srinivas.kandagatla@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFDrd36hqz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 04:27:43 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3863703258fso2074530f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715658; x=1735320458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=zBJzAK2jfJOaXAPYViIEEWmR5gMnLN1yHo2iAE8mbw4e2+yUQ/muSDDND9Ok84Qs7z
         UBQvJincinFhKebdXnkRcBh7mzUEMvkwv2jUBSRCUe0Uu/RgZCysA01Gnt2reje3KHuk
         4weCJ6v95caEJugPDQDjpSkOXkyLapTXKZ+8WJJMzehfefq3YPOQwthoEjFUHNJhGwzH
         /am5XL+hpG9WCFuwaE4j0YKUYeUTh2T4o9OVr0AyEHACuV+2yHLZISE6O/0Bf89vkzkL
         NjFVJVXNvXMtFRG6b1NK8FIf1riUVUvoLoKOeTyJIqtGELo1uFgCOOS947vmnIRTI17z
         bQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715658; x=1735320458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=NG6S9hiVUXVnWp9XsJoOb7xsHUohnnk/WSd/tRZd5ECmjFbh/Zk2VLWv9/Gco7cSRX
         owb2qG7bHRwkwoXsFfVKGSqq5AgD8XK0tUo3Lyy4t6RdcARDiJ5PWiYap/9AoaGjdlUJ
         0+wSOhG+KRglFius8tnZzkADbLgub17Sedc5tjaxlttLGEjFlmkMTE5InK7O/jzbRQ9s
         8J86kVputE04ooN3KFvTP7z+FvM3bcarVhSFLMdOAQPy4mxDWsjEGdcVBXXwAMGHfEMJ
         /cdKYf64kP08YmnNrcslIIqW+BsYb50ylSxack8D5/uSyV9xx0Hk9upLFQ1fuQ92O91F
         nTSA==
X-Forwarded-Encrypted: i=1; AJvYcCVnF7dbvdbCVtoi/S1Lek7Tj+d1B33cBrFORa2QMFafRIGCO+lUzKjDw52jcDXLv9iXjzK16PIYlfiDg08=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqQ45uvqN3P3DJK2b3BXRBbmocengAPdocEVB7oiFRO7QFo6Jl
	M5ryu0+pZ/3YXoAYxXPomhE5r7FsKq2GkqrB6eCakf67kZjFGSL/XeFKPPsTtzk=
X-Gm-Gg: ASbGnctMIQZStkngYiP/aeBu26Fblvzup/HlKibZ4ozPAtaAHY1/PacaxhePDak58Em
	DfLo35mLjyqlpv6/9EAz0eF+2SqZwgKvX9UDElB54FtQ0iBlAHQf25W1N4V0qowYGrYK0zUG9R/
	3/YYftH8i9R4m8yhOAv9pWQWCW+379DyHa9pKAoH8TSxaqtpDRHJVAN/UhxluNl7Se0ppPdfcK6
	fv4HCl5dh1N/L+jzg1CyW/rLbxgv+DeZXUpSkrDJaExqC2JRK0C3sqYV8qN71BQY9JzxFSniKw=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179;
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-mm@kvack.org, 
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.net, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


