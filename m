Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186C887904
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 15:19:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=buJLbX56;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V21XV640yz3vfD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 01:19:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=buJLbX56;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V21Wd4D6bz3vXF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 01:18:21 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso1966029b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203499; x=1711808299; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2oi8/Av41/0O7sn+va1z3hC3DhZlIeMcum4Cd0IBRc=;
        b=buJLbX56mXyNv611VzZbAyQnemNFl9C6LMpS9uWKC9xx4aFL+vqpdpDpDTMIOpYc7u
         I3qk/AAGqSsWDsU+n+dzlBeYIxZa5ueqNoANBwQz6tXcrOXPh46quWPYDVc8OCebX5Af
         MMYRBTTUHPDRcYFe672X76clnaBbDp9doFQm+3P6BGpTknDyGQqV75kQl263TUeFGT6p
         557FC5aN+SWtMX5Fg6bQ5gdr1CNnoNMXyLamv5Up4sV7ysCsMjmbcYRDi+u+GghzUmCP
         V8pHdgp1TGhBZEbyeAnHbiZAy1hKUI85AjgNXruIEF0IZfVFt0OOOku3SC4XE+TLMpnd
         /czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203499; x=1711808299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2oi8/Av41/0O7sn+va1z3hC3DhZlIeMcum4Cd0IBRc=;
        b=CIn6R2U3nJjElCHLCXAIhYLZAuEWddEuxOaXSuNoQtruOKHI95nPVdpBsm31cMkDOO
         AqkcC6xPUMJaEZtQ3HIOye19B21ZvZ8HET+JMtCc9r/+PxgWPkNXWvIdUwNm+zAA4OLU
         Vf4QyHHIZfQTD5LiwCZ5/GOj7S1xD8YuELXCVSvzluT4TAkybJko0rPyIcHYlVIRv6fq
         0A751xunmRgVVbypl36c6aaS9VfZiZqFrJNOXnbfQFfDG6MSX2Q4xX8zpy2/Zdn4VtnN
         0Oe3OqigkcNeB467L0rPNwH48aSZPRgc3jHildJehJ6CDJbGq29yXSeQm/9JuCb/hMip
         iUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJHzgTOb3UAO8aN2FKLr4ZYQEND43iCRSY5bDPTNvHj6J4D4PCIWqbiwfG+aN4LPMsBBFJLEUnpIGIxF+dGqa4ysxHKkgVEtPKrXp1XA==
X-Gm-Message-State: AOJu0YxhoK/Fzx7djtOHmAsOnh+DPa6wHSgBQwhbU08DMOEqho9HUHgI
	9J6OePxz763wCQd5WM3+uI8bORh9WUFQL3bFG62cDx5NAQoh8eZy
X-Google-Smtp-Source: AGHT+IHU7RYX/NffMSkoOzcuHzU2HMiSmyhPHK0+serzkUgaC0dwwzvBwrG1X6ZXGH0gZ+VzSWOqqw==
X-Received: by 2002:a05:6a00:981:b0:6e6:57a9:f8b1 with SMTP id u1-20020a056a00098100b006e657a9f8b1mr2781759pfg.9.1711203498669;
        Sat, 23 Mar 2024 07:18:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fb6-20020a056a002d8600b006e7008bce11sm1422976pfb.26.2024.03.23.07.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:18:18 -0700 (PDT)
Date: Sat, 23 Mar 2024 07:18:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: hwmon: stts751: convert to dtschema
Message-ID: <bc2af486-4edc-46f2-bf0d-abd94538d003@roeck-us.net>
References: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
 <20240322-hwmon_dtschema-v3-4-6697de2a8228@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v3-4-6697de2a8228@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 08:24:38PM +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
> 
> This is a straightforward conversion with no new properties.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter
