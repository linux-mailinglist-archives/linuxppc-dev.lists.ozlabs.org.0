Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D383D8878F9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 15:17:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z12th+5x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V21Vr4Srqz3dSp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 01:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z12th+5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V21V63mGfz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 01:17:02 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so1532923a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203420; x=1711808220; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NT9Y96679eowSW16ewsMwYwbnF/n8rTC4DPmaGQVSOQ=;
        b=Z12th+5xgVOJkgahEKW2eJJEpMN4MIF9iMxHpKV9pb8tKON7d/Ht+6jBd91sfr9MyV
         Ha939UYxDRTT6hFQsv0El1zyaNvsM+2eiHQWhelYWSAXmelZLJ64WXqFLzChLXdHlt+/
         ZSzbx2ga3lQ7wpgzqkFE1Vi+8nzWQ6RoftkA4HVX0YGJTo5bVU0cR3yN9CoH3k3f5hGg
         GUAOeRAnNQ8xnBnM4ugK0MLE7z4wMBkdMNFWnDOBBrAvG4tm59t0Wdp1E+3cAGO1r+nS
         YLANcIzb9i5x3r7BRli6bi2jUl82t/Vo59aDFp7UxqfAeZnbvlpt9AINpPCxXACvqne9
         /3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203420; x=1711808220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT9Y96679eowSW16ewsMwYwbnF/n8rTC4DPmaGQVSOQ=;
        b=YUzDKsPlQCePzN0+pSlWcDn2r+DhO/XP4+VyqwmZePKiRRCJ8qLHDzscs3IeJYNJY5
         flXqjmib630r7TZzkRwYzYL3+VvEVIUNEJWD4pSj7vWdjp0f6QnZlrlya+jET3qWucOg
         vXDunQoChSYwM3XSgl1k7tRpJhMWK8mxNpDNhXQSZyfnwBPZ54sn7WMCDU7eLosKSCMp
         +tJgX6DLmXffWZIsDWmYY0wbG0QG1M6c1ouD7CPebLIfczS8aJJNtceZxMX92zZ3aXSR
         K3nZsf1jCrplMUS5EsPpwTTji97nKLiXs1fNYugysiD24QGIX0CPbwfdp4HL9f6whZQ8
         p6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVa4O3YUQWr7I0xxV7288j7oY94rbW+Y7OKiyO2cejfWkIUAs6/eFDKAYVSw5yspykgGR2X7BqW6ACvH7LFWYT4MS8lsPtykDDsPIvJng==
X-Gm-Message-State: AOJu0YxOpKRQ5x9JMkdezDdL3YSS5lwNQZoFpKtj5wVwzLy6Q+N3zEC2
	DrSagvz0Hkg04ogdJlb7iMrYQDMwuZB8omOb1Ry3pw2jU5SHBIr8
X-Google-Smtp-Source: AGHT+IGZGLKChyVn+YDzIYRkVojMpFXoB8t4ZAnQmRNuwvKHHeRNeIhXEwcEg9AGsvz1HSwTjbqWxg==
X-Received: by 2002:a05:6a20:5085:b0:1a3:6c9e:1e31 with SMTP id l5-20020a056a20508500b001a36c9e1e31mr2060019pza.19.1711203419848;
        Sat, 23 Mar 2024 07:16:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mo7-20020a1709030a8700b001e09322cd1esm1609086plb.150.2024.03.23.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:16:59 -0700 (PDT)
Date: Sat, 23 Mar 2024 07:16:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: hwmon: ibmpowernv: convert to
 dtschema
Message-ID: <587c30b8-9a2a-4ce5-861c-53bb87c7698c@roeck-us.net>
References: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
 <20240322-hwmon_dtschema-v3-2-6697de2a8228@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v3-2-6697de2a8228@gmail.com>
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

On Fri, Mar 22, 2024 at 08:24:36PM +0100, Javier Carrasco wrote:
> Convert existing binding to support validation.
> 
> The binding has been renamed to match its compatible strings, with no
> further additions.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter
