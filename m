Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E888D8878F4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 15:16:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UV5isOiD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V21Tw5CRLz3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 01:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UV5isOiD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V21TC5RsVz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 01:16:13 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1def2a1aafaso19161125ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203369; x=1711808169; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yHZUKY2RezcV60fnvTvfbW3kfQRjFkJeR3hdq5nZuY=;
        b=UV5isOiDdidMVayGY+smnR/HxnGdZuCj3HCpPltmL/5xA+gOClY4IeUAchIVPwBwvJ
         cargBjphQfNXTDE8VJfDkdQ6YygR+TiOGy+j6bEQfZGGpzfRZW7EmrvJSU/e2sy3jCYe
         PoLOzRxoCNmp1Txu4eU7ZffJGrgosykCW0tGIsMorOYyCtNclZBrq7OkaO6/OMDaSTLj
         LyPh3wjqh4ogSorDLheTjW4C2UqRdg127q0icMJTjT5q/3ymEPX8k2VAflcDv/q9MPyo
         rerdgTcHHOU5nMrLrdoqHybMFBgmJPToFtVXHF0yu8q+6VNGc5ccg8Yhc02jsTSisgxs
         xzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203369; x=1711808169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yHZUKY2RezcV60fnvTvfbW3kfQRjFkJeR3hdq5nZuY=;
        b=jDouO65s6hrwr/dPSao30uqs6vpPXik64hG/5Ah/OdAD7YrwiGP7ODEcqbbN2boBLr
         HWjCWiyvl4KvE+KiSZEh/IPs/zRYAXkuJT2Cw7j0XfS+GqoBwOr3rgOxsPoB76YfZIHe
         ASxrwk+KxwILrS13offFzpvSg4bjOD1JKV7URKfpGwLLH8xd7w+imuM6YiPWB9m0LI14
         j0lFJosTo/ajbnlh6ZP1idRiAvZPX9IyfANbV1dwLBAMnL8sndXi4QkXk4aiNqPI0wtk
         0taNu6SebBdqHC2NCgkwP2caYEGveUDT0ektFRdoMut2lgP8BI5nO+vat+QO+NjbNpZJ
         uMdA==
X-Forwarded-Encrypted: i=1; AJvYcCV+9l7/IkcM8km9tZ7Ephr3lh4VT8kQbL+B/12zlcUq23XL+R/dK6QJFYyzXHj3wAGCYW8UEzXCVAeVTIGp4lYkdptBAqYeGK0yts09dQ==
X-Gm-Message-State: AOJu0Yyc9U5355kADlwDxtjjyT69kBmPzKyi1IWyXZoFepvvU3Fa/5jG
	Uc9kgoGq42iTpPfoPsWlVGpzg+Uc8owSrqWUnXBEMXzRHKm2P9JD
X-Google-Smtp-Source: AGHT+IE4Qp4YYnow/2jOmSjfy+hfB76Afq1NrBb0M4yGd34xRyXDm5SXGf+ljHUMeWADEY6YII99dA==
X-Received: by 2002:a17:902:f641:b0:1e0:3f65:f503 with SMTP id m1-20020a170902f64100b001e03f65f503mr3201038plg.39.1711203369046;
        Sat, 23 Mar 2024 07:16:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001def0324a64sm1597237plf.135.2024.03.23.07.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:16:08 -0700 (PDT)
Date: Sat, 23 Mar 2024 07:16:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: hwmon: as370: convert to dtschema
Message-ID: <aabc0c6c-dbc2-4e63-ba7a-f8c15db714a2@roeck-us.net>
References: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
 <20240322-hwmon_dtschema-v3-1-6697de2a8228@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v3-1-6697de2a8228@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 08:24:35PM +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
> 
> This is a straightforward conversion with now new properties.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter
