Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3790A5AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:26:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OT+SArpF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fzh3x7rz3fnh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OT+SArpF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fZW251Lz3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:08:18 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so3872847a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2024 23:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718604491; x=1719209291; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKO8P5Czfx1WnhafBBluB8wH3SA6wYMPe7gjBVA/Pmc=;
        b=OT+SArpFZreW74TycGSq6FnpA0+kw+55Z1LYg7GU+C7SjiDcSkgSx6IcjNliTpHPvj
         9OdlbVcfRN/ynIV9YV/OAmN6LemLf2qZqJvCJglM0tQxZWl36N/+X1jlGslTrGWnIW6B
         qIMo3ix93e1T+RQkA2NWysGE6C3whjlijgMJtjiZIY0qyfsb09HxqZ3p5OEL9G/q7xzR
         i+o2BVd3krO1o3qZ/bE0Lg5/sHe/AZU5RcfxKhJac7zZ2D4xnxHtbsSHs7XzBzaT7RUh
         aYkM5JDIw/UAWBUnaYofwf2Q1Dp2FphRcomkNYOcpSMxO4I9yQWX3rh6oHTpB8HRLtOx
         K7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718604491; x=1719209291;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKO8P5Czfx1WnhafBBluB8wH3SA6wYMPe7gjBVA/Pmc=;
        b=Q3OExnTBokx4IRDtqwPWkdK0Tz01wqiTqUgtHReb58lJMy4glerGuc0pIFE6mfH5A5
         ljzdlXJ5Ua0Cm14lxbtf53xe+fbZsjtdPIeXvoBs0cS08hKOHYyS+yTP7AB3VsKX+r2+
         FmQfu9NTAERDR/gttXMMogpIpbdjPWIorHLcvAjPjnSXu2ZzN0kvHLVytjZULirkoS4v
         H96ONK9Igf2u0JtxH7vJ19P7l1KgILKbBWrbbTPzqn7z9nG3gYGq91eoOvOI+wG0T0RD
         vsYMdj9rDCQ/iCQ+PIAv1Oub3VNEjbwu5QkNkZfi9xGqeEauo5eNDgPa9opIQb+rimMw
         arUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF0Edji2T8y84wbjbHVeRctkShd6Axkg1CLSZPv1B5tRGvynk3UTcX62Jk+2LmpHt43shuv2aULdQ8ZoVUEuWCU5swZkHmwJe04BRXbw==
X-Gm-Message-State: AOJu0YzfKVg4f70p09pDPCyifg4nySohd2OUiz+5F43dDTUtP8UqsQjH
	p/c55hjBsvdUb1W72P6aAYxwdgOD5qvvGi/hynYKIen2cmF1yeNaDDa0LQCUjpQ=
X-Google-Smtp-Source: AGHT+IHRI8/tCYc6BnuV/uya/p/psKWyF0ePa5AAATsxGYnpRVPJ3Wrjsh2wX3DrkHiS5SaLt/GHeQ==
X-Received: by 2002:a50:d6d3:0:b0:57c:6d9a:914e with SMTP id 4fb4d7f45d1cf-57cbd69e7abmr7621408a12.30.1718604491461;
        Sun, 16 Jun 2024 23:08:11 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743ade6sm5937491a12.95.2024.06.16.23.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 23:08:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Michael Walle <mwalle@kernel.org>
In-Reply-To: <20240604142249.1957762-2-mwalle@kernel.org>
References: <20240604142249.1957762-1-mwalle@kernel.org>
 <20240604142249.1957762-2-mwalle@kernel.org>
Subject: Re: (subset) [RFC PATCH 2/2] dt-bindings: memory: fsl: replace
 maintainer
Message-Id: <171860449047.4724.10770903267718231915.b4-ty@linaro.org>
Date: Mon, 17 Jun 2024 08:08:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 04 Jun 2024 16:22:49 +0200, Michael Walle wrote:
> Li Yang's mail address is bouncing, replace it with Shawn Guo's one.
> 
> 

Applied, thanks!

[2/2] dt-bindings: memory: fsl: replace maintainer
      https://git.kernel.org/krzk/linux-mem-ctrl/c/815cc7715ab183701de42b570a28b4e3d877ef6c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

