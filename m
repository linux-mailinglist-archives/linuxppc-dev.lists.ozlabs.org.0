Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B698878FE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 15:18:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hDdvjk29;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V21Wk1062z3vYZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 01:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hDdvjk29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V21Vy3w7Dz3vZf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 01:17:46 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-366c49ee863so12936385ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203463; x=1711808263; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Du2UCi/Za+fAfUfXxuWN/JpNBxR09hI/ccpSO9Qj/c=;
        b=hDdvjk29AYYwPyDlOYmOo4ATW512k6/wGVOtRU9fsekc3hyyq0IcR63352mXPBdWXl
         U7OIAIo3G90Fbype904Q0ZpSFhxj5wJ1Hfwjm08yNH2DtyPFSbpeW+keSJ2K1lC0hX1s
         DPY1GrNZlCovlVCgBp2jOtWUanfCa/Y8I1RC656pGL4ZMgwlgP9W1HyY6GtusnQB51+1
         Qwq/SbVA96479iIkhyDYOgVBlF1ZkTrxfuB7/jMhE9Uxc+DSXhRr8TdCt8EnpksQaHqC
         swCisJjPlXRUXqb9RRDm0T3GTPDp+1Id5R4GKxdNG2eefkFuoLdcBGWcL5ksJpT1JgH0
         bYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203463; x=1711808263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Du2UCi/Za+fAfUfXxuWN/JpNBxR09hI/ccpSO9Qj/c=;
        b=diB0IX5MUiYHonrPPvIr1VZ+WI3wu80GC/PbGSMdGDmHEjmCDepDed+e+Pi2tRq4ki
         Cgk3DL4s7d1/YFbKBB7vYLGF7Edq0u1t60n17vN20tbJOvN0erOO3c9JANztft8kYIxF
         VVnlh/z13UXPcvg5KkYLkkwNox/es/T+MEkDlH+vMJfG16FZvSGQOCyCY8eRupAFZsZ3
         hd1yJKleeMACofq0EJrGihO+D7q/O+Hdny77o/E7v8kLI3V9CGF+808zQZqwEbyixnIL
         1UX8nEHWGm1hhyZDy4m9rbd083lXurZytIgTB3g9tUHnOiLLVbTHwRmT4h+LGgsouvj1
         AGhA==
X-Forwarded-Encrypted: i=1; AJvYcCXwvm/zh9AiVbQ8RRYXNpp419q5LiUAbURWO/937fUqmoVBb1ZrRdzgtqE6TlpOVRD7ZK3tPmIQEIEPTdvlz+OeKggwJk8bqx94AJpN8w==
X-Gm-Message-State: AOJu0YxH/sHDu7JqYnJPlGH9hATEzBKP+JTEP/1K2phJBcJb/cS/XK4/
	wQ6TNb7Cly9cOOzYp/bSWjfJiFCxw33ADUjtS3FgentQ6fTr2m/z
X-Google-Smtp-Source: AGHT+IHSImgq5ZoHSc8ygl85DESurCHPEm/wpSMX4HtohmWmvpXpFOETDeT6qYeBe0Sv2AKB2WDdYA==
X-Received: by 2002:a92:d14a:0:b0:365:b4c7:5e9d with SMTP id t10-20020a92d14a000000b00365b4c75e9dmr2404375ilg.27.1711203462886;
        Sat, 23 Mar 2024 07:17:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l63-20020a632542000000b005f034b4d123sm3177412pgl.24.2024.03.23.07.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:17:42 -0700 (PDT)
Date: Sat, 23 Mar 2024 07:17:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: hwmon: pwm-fan: drop text file
Message-ID: <c1affb1b-4c36-4428-8c9f-a585206f87fa@roeck-us.net>
References: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
 <20240322-hwmon_dtschema-v3-3-6697de2a8228@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v3-3-6697de2a8228@gmail.com>
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

On Fri, Mar 22, 2024 at 08:24:37PM +0100, Javier Carrasco wrote:
> This binding was converted to dtschema a year ago.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter
