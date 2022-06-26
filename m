Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D355B155
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 12:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LW71t3l0Dz3cg1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 20:50:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fe1iXci9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fe1iXci9;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW71D6DnZz3bhK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 20:50:24 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id lw20so13396282ejb.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 03:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qm3saVsXQFyYF7XKRzCFxHnQjtvbQdpVuuv8fnV6oQQ=;
        b=fe1iXci9tCe6L2xFZ3P7p/kc36HTF7DyalYl7LT5YmzKnyaEtnBgqkPALfoSYHafMe
         5seSCpPDdR8BxgPRyhdnMFqxf3xe7G4yT13IqyEaN+mlk28EoUneItnD88p6ExFLvkMV
         MLTO5q9Nu7Brxsbf/CaW+QS4TqRzAUsl5UG/Ogcjdy8CNSV3tsDX0u/EoStiY42fXP59
         xWLSI3Nb67HE3r/kxb+JsRZdbZKmuNsfcQD74UeD3JknRSNoqpiT3xZlxr3mghMP0ORF
         bdc7eXZCZn4C1vKzMxHkOzBUojeGzfPOKNKXbnFD9KRfG3VJ+nEcBbK9Ccl2Bv+ZLMVZ
         EIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qm3saVsXQFyYF7XKRzCFxHnQjtvbQdpVuuv8fnV6oQQ=;
        b=GtrbiMuUwT45J0Xy0aOxq/8td0+uuuUKvgmcunXXADzopkvvsq3kMBNSlc2Gad9QlE
         CZxoCPY5nlBDqRPFncCUaA/Dsjteznbjen+n0x5q1e8XKfhKTIL2ilC2Co77uVtQl8rT
         +E2gsBQJTiiX7F2uv7O5Ml0hiyTeMtgtKCCj/d9X7pL/rNhJ/03LGJgDsYTthSSyPM/8
         Iu9SIDh/FwwlVx3HyWRbF6HwApxWQ+lUL2MoGrERFMCq8jl4lVX7vhEQZVvVRk/Dpczh
         Dn8mvve3G4+b9eFzuZLqdJnjCdIVvcfPzqLDGJmJgtWOnwyemY7fwxfcDKvnRVL5CeXO
         Ho4Q==
X-Gm-Message-State: AJIora9pQFPs1Axt2uaIHhcXl3SJ+BzjO9F7N+kPAOXvXODXP9o4n3ta
	zcuPrvABgo668IsezrKYDS97bA==
X-Google-Smtp-Source: AGRyM1vsckuhI5W/5/+uG8dWjoP8xYOurUPiiZq7KICxgI9Tk9qBUslJdZ7qw4SBHIubDQ+UPYVtVg==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id s5-20020a17090699c500b006df82154ccdmr7281866ejn.684.1656240620912;
        Sun, 26 Jun 2022 03:50:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x6-20020aa7cd86000000b0043574d27ddasm5623845edv.16.2022.06.26.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 03:50:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: bjorn.andersson@linaro.org,
	mpe@ellerman.id.au,
	vz@mleia.com,
	robh@kernel.org,
	abrodkin@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	krzk@kernel.org,
	balbi@kernel.org,
	Sergey.Semin@baikalelectronics.ru,
	agross@kernel.org,
	gregkh@linuxfoundation.org,
	vgupta@synopsys.com,
	khuong@os.amperecomputing.com,
	linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name
Date: Sun, 26 Jun 2022 12:50:18 +0200
Message-Id: <165624061445.7618.11344979529426500237.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru> <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, patrice.chotard@st.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, paulus@samba.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jun 2022 17:16:21 +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named despite of the warning comment about possible backward
> compatibility issues.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name
      https://git.kernel.org/krzk/linux/c/fcf036a017b251d362559cf7eb0bb6e614ccf842

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
