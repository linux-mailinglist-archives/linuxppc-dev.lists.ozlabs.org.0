Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094BD7FA859
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 18:52:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfCpl4Bk6z3cj7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 04:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.53; helo=mail-oa1-f53.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfCpH5lz1z3cPk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 04:52:06 +1100 (AEDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1efabc436e4so3047016fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 09:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701107522; x=1701712322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qP2c9CN5CjrhkwDV0xgvtW5t/xJO6d0tsdDX2eLr8w=;
        b=q5h35j0SwCnPo823LGJY1svSBaZJ4B+j8MHvB91zQOzabbpRlBk3SZqLzR27nrhvW0
         +PEqPAHNy//aiSLOoop8OUJJv2PgjwwzUqbYBkLJyiqpy5o/44qxnW41o5LTIHkKWQSU
         CMs1QdoxqE3ZQNExQFUxHu5Xjgp1taazvYjKVLJBsTURHcMCSbA/UoyPEHCZAOg6FbZd
         yWrkKB++4yvd3SKSzp2oaBw2P+KgRIVudWD0zsP2WVwi15KqWw4Qwk0SsOPhgDjUtQsb
         NbO3sVVyJ3RogQQXVwD9eESdyC4vdFxiJMZgV/mudiiSMbRpYnnlIBWdiW6KYop9APLz
         hoZQ==
X-Gm-Message-State: AOJu0Yw+TlMrrWAxU8X/+beOqgo93JoWyfkKWL1gEmwCpqlnInTD0c3f
	vwx31zorltb0zP0WewYunQ==
X-Google-Smtp-Source: AGHT+IG19I5lae8dWTQhpITCeP9FKx74DPu+CfRsHG/iq0HJR8akTbrvzMlAP81KjFrZih4SR+NR/A==
X-Received: by 2002:a05:6870:d85:b0:1f4:daf6:78cc with SMTP id mj5-20020a0568700d8500b001f4daf678ccmr15957254oab.31.1701107521903;
        Mon, 27 Nov 2023 09:52:01 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z19-20020a056870515300b001efce0658e6sm2436211oak.39.2023.11.27.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:52:01 -0800 (PST)
Received: (nullmailer pid 1854610 invoked by uid 1000);
	Mon, 27 Nov 2023 17:52:00 -0000
Date: Mon, 27 Nov 2023 11:52:00 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: fsl,dpaa2-console: drop unneeded quotes
Message-ID: <170110751966.1854443.5792070352001940257.robh@kernel.org>
References: <20231122224419.2809361-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122224419.2809361-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 22 Nov 2023 15:44:19 -0700, Rob Herring wrote:
> Drop unneeded quotes over simple string values to fix a soon to be
> enabled yamllint warning:
> 
>   [error] string value is redundantly quoted with any quotes (quoted-strings)
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

