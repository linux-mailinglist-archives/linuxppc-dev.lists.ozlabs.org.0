Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0601BC44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 19:52:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452pLW5TVFzDqH2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 03:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452pK63GBGzDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 03:51:21 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id j49so4947093otc.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 10:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m4N4IZgDvzO5+VbOkAL+/qLpzVDWLu+YalUcmqAEWjc=;
 b=twEsscWNgLNCdDHqNP/Nr2GWvSIWpUhopw6AUBw5lqTiljW5VMk3wMsXgOKuoVvkgi
 Be1UCAvd8t8pleBjSTExEDJEpGZxek7eQ4/+gBuW1nvHhZEqI/sXJyhtfW89hBcbI69C
 z453moZ+fGIIsc2cR9PXO9/6Z2GX8i+Sckc3ytjrWZnFIhVnmWTmYHU8VgVh1S0yelJ8
 T/vOjiqS6ezOh/l97HCFqxQwd3bVzazcLLMpCTFDUIr2yWmkxAC4AzVR+rCh/Nvazo2i
 FMt5VChjTTOEH8+9IN1TuQnD8xlFWUu52VUb9iLPIiWdqiTiF1KmTBUDAQ03hVlof40k
 oNTw==
X-Gm-Message-State: APjAAAVWjRx4BtTt4q43/7Lojxx3iGbGBDEXTy4ClH6rkzwbgd1l+MWz
 XQ9MTSmxPDH/8R0AaS/uPg==
X-Google-Smtp-Source: APXvYqyi6vDqkZOF8NsHPlQ7yDvigtmGZCYFZkAc4wdlsemMKX21ODIa4vUe8/dokESav8OUMfKvnw==
X-Received: by 2002:a9d:6d8c:: with SMTP id x12mr11381060otp.34.1557769878486; 
 Mon, 13 May 2019 10:51:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x21sm576703otk.4.2019.05.13.10.51.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 10:51:17 -0700 (PDT)
Date: Mon, 13 May 2019 12:51:17 -0500
From: Rob Herring <robh@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v3 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums  binding
Message-ID: <20190513175117.GA22288@bogus>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-5-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513111442.25724-5-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Mark Rutland <mark.rutland@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 May 2019 11:14:58 +0000, Rasmus Villemoes wrote:
> Reading table 4-30, and its footnotes, of the QUICC Engine Block
> Reference Manual shows that the set of snum _values_ is not
> necessarily just a function of the _number_ of snums, as given in the
> fsl,qe-num-snums property.
> 
> As an alternative, to make it easier to add support for other variants
> of the QUICC engine IP, this introduces a new binding fsl,qe-snums,
> which automatically encodes both the number of snums and the actual
> values to use.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
> Rob, thanks for the review of v2. However, since I moved the example
> from the commit log to the binding (per Joakim's request), I didn't
> add a Reviewed-by tag for this revision.
> 
>  .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt       | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
