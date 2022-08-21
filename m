Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FFB59B63F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 22:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9n2v6Cfvz3chp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 06:21:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9n2Q14Tgz3bZ2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 06:21:32 +1000 (AEST)
Received: by mail-ot1-f41.google.com with SMTP id l5-20020a05683004a500b0063707ff8244so6452605otd.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 13:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=PVuioZgMAt6vNkSn1eOBdpre99mEwl3P9i1P8iVmj+8=;
        b=gC6v8bkA1b6XuJdOmr0AoaYj3kVzlpUB/y3Q8Vy4wVo8ym6+46lcF1YzBFa0cBaFr9
         DV/ElNpKmBGT4h+EXK6L/pJbJJG22lSZx1LaIm1h7J74X8c94WCgBhR7xdHoI4JEMEOU
         t/8WAQYFgKezefJ7ScDIQfTZn44uhprDG/9T7pVGT5v5cCamRR1oKi9w7MzP3cuFbvKG
         rEjA491iIOheNI1+jtDu9afSevzN2bhPFH/U1amzc8zxvet3WAlbj/jHPdV716LbVMef
         3hvX2vJleJxOIbNBlGcS3Bo7q7wknnmF1Kig4dKkeRrh5s8QfO6I6yvWOkRnYKCf5D1/
         aACg==
X-Gm-Message-State: ACgBeo2YDjBdjqsfjlvYWcxn4W5/s/bKVPEZRY0ggPHxURzvU02qdmls
	/zmoh08M7YxlsP0dkubEMQ==
X-Google-Smtp-Source: AA6agR4eZaKEm7s31F45rhLJ8zF/zjY5hOre51bsur5f7rfWs7/1+O5doQlYJ6KKIuNQfod0umZhmg==
X-Received: by 2002:a05:6830:3985:b0:636:aa59:ea1 with SMTP id bs5-20020a056830398500b00636aa590ea1mr6780979otb.44.1661113288006;
        Sun, 21 Aug 2022 13:21:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m1-20020a9d4c81000000b00616d25dc933sm2517031otf.69.2022.08.21.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 13:21:27 -0700 (PDT)
Received: (nullmailer pid 1729128 invoked by uid 1000);
	Sun, 21 Aug 2022 20:21:26 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>
In-Reply-To: <20220820102925.29476-1-pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: syscon-reboot: Add priority property
Date: Sun, 21 Aug 2022 15:21:26 -0500
Message-Id: <1661113286.905357.1729127.nullmailer@robh.at.kernel.org>
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
Cc: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 20 Aug 2022 12:29:23 +0200, Pali Rohár wrote:
> This new optional priority property allows to specify custom priority level
> of reset device. Default level was always 192.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  .../devicetree/bindings/power/reset/syscon-reboot.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml: Unresolvable JSON pointer: 'definitions/sint32'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

