Return-Path: <linuxppc-dev+bounces-7787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EACA93807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 15:37:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfG6B31lZz2ywR;
	Fri, 18 Apr 2025 23:37:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744983458;
	cv=none; b=KWZnSI5+opWdznEflzwB93dB/u3IQkZL9tsMxvhq/5+y78WKWvOZcVSz/bBozO4IXalvEdtW0NKLXne5MdDGKaDD73hWPfW5ysYpvUiKZ40H0qnDB13y0beCyFCpX0ayVpKpyx0Eveqo9e4kBixp77Wqhd5f6geJGCdjuaJeqa1z2gBb6Q3XzOsnCSMABbFeicPpBTo2X95IzmZsgiox4AXkCUBinUPFPKxSLIwbfkYlCl8rmuUJfIb2uZ798R3G4cwvIzDfE0ORP1y4TJJYljuwTh24nBCXhqnR2eN+tzzSNQru8rBKgQu5KhFYhC3S9QucQNOidPqqMAQx35vSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744983458; c=relaxed/relaxed;
	bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg9HEcytk7eEbRoEGlJW8rJlQe7G5MfLxZ/Uo/q4alKbSDGgVZsOF7Kub2+JKpesR3bSPXT0/RWuFhK3ip2/agD0gUsdwt8/khxtUphsoX/77EXxRp1DdEE3Jq6kmzhtA0hEGd4HYj6L1GXZghIw/XHQC83BM4pG/XHRVYmwtx/eEHIk8sSypI6t0E/AeRAZnSvfXx1E28nH4Uk89obNDmdyIipdFHWlcQ1wKgqYYACSd/WitIQ3c864PxuR5gjIXb5NIl3Xd5jLj1+juQ54Vggxv9hS8K5UThdp/RumeaRu8cLhWtOQripuFIDolGq2KpqpFn8NGWWtDOEU8nOn1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFnD5T05; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFnD5T05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfG6920Jjz2yqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 23:37:36 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so535252a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983453; x=1745588253; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
        b=TFnD5T05VyYiUsheRf21tDo3R/0mTxB5Svnn9R8ISIGq+zAzRnLMxMSdmIXH8SKEA8
         a5OTkKANdyMJBCvGyD3ituq1IFvQpuua1k5w+hJ361ZdkF6Xo7Sp+0SOoYcR4K10D9G7
         cWOyz4mAj+tNr8SXGG3CZLTO2tn9mEhHX+e3do6Y23iOagqODn8V3i7HUa4UkQfgsMGV
         PneqQJcDsdG8cQ0j/W01mPTGmAcGseoxMDcEShvGnjwEO0kU8mdhN5g+FNa1tguwQ0qy
         M8X0uMHCmzkSFBcP1kTMbMQH5QY3s6Kxa7Jjj48/cgaME8JXlEoWwytfJT8/4UkCP1AC
         0o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983453; x=1745588253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
        b=aqCZSpWVaYujqIk1F6/G8vQ8w9XLCwjgZ6CHBThzIPY4F3l1XqySiKMBs2jHNFkMLH
         5HMhfdPBkNAxfKXmMIRxGLyo+Lb7MPuC9CUbeTU6QjCIpw58oVdEcacetM9kGX/qfXZ4
         mnwfokwGK6Wd1sL4lpaQOngncZgYUMQDBKo7wKJwToY17UpgZeFbrCvMhyLuGbtBGG1A
         Q5SgwLt3+zcIKG3Bl5FBdilMuny2EcOEHFt3fdPKFK3EJ0XiO/PBaGDZVmu2im7H9vX/
         oTFOmCQz1evdRMVuCDkY8MO9/LpMPIYbGC2IZ2kpDrNB2otENUF0/AS0p1J8JUH4sm1C
         0GYA==
X-Forwarded-Encrypted: i=1; AJvYcCXzZUSkscV/b3hSFsFRMUwlJLC1qJIOzYn8TUKyfvPe3W5P+ig8kN5AGpIcFBWNHK7stZdwIWtSUJlMtQ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzcdL9Ireh5uAdVwGV+i1TN9RVaolQRvfwSFNe48cz4044HCR0J
	KhzyGIonu0KsPHJnoES4LKv0KZywGqI+l751vskNPEgXKJ5uyzrn
X-Gm-Gg: ASbGnctdedMzc5oKsY/CrGVl6+q7cOqsKzyyYJOMqb/LU0043hySBbO76QWtMEzJ3cQ
	VhduKsTrVrbj7+gLryKLAL/8q81Met1Z+UglhKv+yzpufyHNk55dSnwuV8zivUxyT6mTnQGy6++
	EMABkklzchUSM/MM7VkaS/4AsNbMUM0fvpQkAuaTG3E9HYqRbdXzEu0EkCw02qw1T9eO1bzmdX0
	cdH4oIm6DMjizVr8QHU3vuBWsdaf0WThYmEJHcdpbzRUY8Ur8ktx3zx2lzy17xL8jY2jFKyMrDd
	iPyyMQRBaFgIndfJDqwq6ZLZHNMX5oEA/pnVpn4=
X-Google-Smtp-Source: AGHT+IHDLcatUwVL3iYay48R00vjtUcVAnpAwx2hlm/q6/jMDb5Q5PmviuzfcY6HTPtV69wle8gO+Q==
X-Received: by 2002:a17:907:1c0c:b0:ac2:6d40:1307 with SMTP id a640c23a62f3a-acb74dba1d7mr79825366b.13.1744983452751;
        Fri, 18 Apr 2025 06:37:32 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4f6c8sm123584966b.64.2025.04.18.06.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:37:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:37:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 03/14] net: enetc: move generic MAC filtering
 interfaces to enetc-core
Message-ID: <20250418133729.ul4ocm6ie7b4my3y@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-4-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 11, 2025 at 05:57:41PM +0800, Wei Fang wrote:
> Although only ENETC PF can access the MAC address filter table, the table
> entries can specify MAC address filtering for one or more SIs based on
> SI_BITMAP, which means that the table also supports MAC address filtering
> for VFs.
> 
> Currently, only the ENETC v1 PF driver supports MAC address filtering. In
> order to add the MAC address filtering support for the ENETC v4 PF driver
> and VF driver in the future, the relevant generic interfaces are moved to
> the enetc-core driver. This lays the basis for i.MX95 ENETC PF and VFs to
> support MAC address filtering.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

