Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC7377C4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 08:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdrrl46Xvz3017
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:35:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FSkP6wfY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FSkP6wfY; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdrrF2llQz2xtx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 16:34:36 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id x188so12914470pfd.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 23:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=HGBIj8xUCvLd4pR92wcGs7mrQ/wDR/glW14gv4YWYBo=;
 b=FSkP6wfYfoiAqoFvwcrgIlb23ul8X3ysCcFJFTMF5SkPwiSpWGAwpDdGazSHkyjpry
 3HWhIJt8eE2wzfExp8DekB/vPL/66FIDevxZbocnKC7eVumawLEMNhdb+QQvmOqPDQDn
 RAIq9BKjJeLsY25YtIDLKef7run85JCrFhgwBZoc6PpIDcNY2XbD1Ldt3QUVcy7xA1OY
 oNLES/7XtUXULfoZuH5m3wUM/qYFz6bzhl3B5K4FEd/uGoGCMJBh5zwMXFtpWxnwCn6L
 0FgB3nzDfwdrA2/yLbyI/CkND0sQhV+RXehT5qYgpiij4KQCo//LNsbzcQ9LiBBUimcr
 0kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=HGBIj8xUCvLd4pR92wcGs7mrQ/wDR/glW14gv4YWYBo=;
 b=mTwBjuwOoKsMDaF9/VJ1z9xNTde5DHz6bt5SEzoOZPqMFC1Jq/wAC6oKdZHDKTWBTS
 RgwKGh2IVfKqp+eZrMUWvW1uDcBPzwGTh0/OHYrzDWVIZBeEWn+xRrrdh5d7Hu6f45Fj
 pS9LMOHT6sgwwK2K/UGDTcR4cADqwH+OiRjaX8InfW9drv/a1u1Y2epr9H/n93IMqobi
 7T/Fzpc+r32ZyRuKV4JQhvOaMxkafwSrsX+3y2ESxV/tY9IkNVAarrBzvNaICf5iTXQ3
 57jNQE6YNLut9nLWoaKagN/2YH5ski4o7W+XRCxcoeM+rkGV+gG2MZct9yLQmB0th5js
 faQA==
X-Gm-Message-State: AOAM5328sD/i/LjWqRwY85CwaDP0/wknvgHsb9x2g4eRmAPv//a9RLtE
 z4ybYPZlI2IUsV0Sdj2fbJo=
X-Google-Smtp-Source: ABdhPJzKjkEWER95RQjk6gSGm+pfadu3RCzIx7RnZbs6Tbke3SB1wLEpbFBChpx80zNtTXx1WGBJnw==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr23667445pfb.76.1620628472772; 
 Sun, 09 May 2021 23:34:32 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id y23sm9999389pfb.83.2021.05.09.23.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 23:34:32 -0700 (PDT)
Date: Mon, 10 May 2021 16:34:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 12/16] powerpc/pseries/vas: sysfs interface to export
 capabilities
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <60176ad795219afbeaf51ad596af4bae710617b7.camel@linux.ibm.com>
In-Reply-To: <60176ad795219afbeaf51ad596af4bae710617b7.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620628126.jezp40t2h6.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of April 18, 2021 7:10 am:
>=20
> pHyp provides GZIP default and GZIP QoS capabilities which gives
> the total number of credits are available in LPAR. This patch
> creates sysfs entries and exports LPAR credits, the currently used
> and the available credits for each feature.
>=20
> /sys/kernel/vas/VasCaps/VDefGzip: (default GZIP capabilities)
> 	avail_lpar_creds /* Available credits to use */
> 	target_lpar_creds /* Total credits available which can be
> 			 /* changed with DLPAR operation */
> 	used_lpar_creds  /* Used credits */

/sys/kernel/ is not an appropriate directory to put it in. Also camel=20
case is not thought very highly of these days.

And s/capabs/caps/g applies here (and all other patches).

Thanks,
Nick
