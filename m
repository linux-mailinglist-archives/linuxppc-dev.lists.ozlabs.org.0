Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8A10E57
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 23:02:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vW6s1t2QzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:02:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vW5L6yj1zDqND
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 07:00:53 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id t70so79949oif.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 14:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Fhyjh+pEfTmxGVzs4D2NxCU9BjdUSsUEryv2fL7NV2Q=;
 b=KkBwHFJeIwybpzLgk96BdtiEh2QoiqS9gXMkptfroGH5/TJf6fArp6wQKWUaLKboQN
 omvBm4TMx7j8EoVgwhpqvNMJo4Wz/bUTNCbc/6HPUcWe7B+eHpIYe0E/9Nt5cx0F+xBO
 0VBsVFD75dcs4iYklsalcdQI9i0bfeJ6xH8u+G1/imCoKddj03nd0I0jdu9UU0LqDPBw
 iOR18xOnXlEYMkwVXGrcMzxW0ZWbIig0f0liToFLNxo0f/6MdMFBhdJo0AfS+mbauN1b
 1simPGSHy9UhbDm5iyOFKFqiiDJSRP6lqjFYuqFraNFT/NVYqR6tHhrXrAGhU4kROn7b
 fcQQ==
X-Gm-Message-State: APjAAAWYTl3NHpdgRP3cuRguacmqIdje2m7+ovoSnQi2ZiKyO/9PJ7R8
 SpcLHBlJuJZiVBlBvFVM9g==
X-Google-Smtp-Source: APXvYqyNVKjPoji2SxJxP3ylggeCueF4E0E33rMuGH1+fipTxjK6PYV0QFeg1sxueHl1rXk5rOqFqA==
X-Received: by 2002:aca:fd52:: with SMTP id b79mr241015oii.34.1556744451588;
 Wed, 01 May 2019 14:00:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m206sm17199824oif.50.2019.05.01.14.00.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 14:00:49 -0700 (PDT)
Date: Wed, 1 May 2019 16:00:48 -0500
From: Rob Herring <robh@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums  binding
Message-ID: <20190501210048.GA20658@bogus>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-5-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501092841.9026-5-rasmus.villemoes@prevas.dk>
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

On Wed, 1 May 2019 09:29:08 +0000, Rasmus Villemoes wrote:
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
> For example, for the MPC8309, one would specify the property as
> 
>                fsl,qe-snums = /bits/ 8 <
>                        0x88 0x89 0x98 0x99 0xa8 0xa9 0xb8 0xb9
>                        0xc8 0xc9 0xd8 0xd9 0xe8 0xe9>;
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
