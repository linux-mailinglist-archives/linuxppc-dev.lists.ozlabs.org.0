Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CA2A888
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2019 07:30:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45BTGF1Z4qzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2019 15:30:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=blackgod016574@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFapM4S6"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45BPY04fzJzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2019 12:42:55 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r22so4685779pfh.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=RkwkVNo4DaOAeSezSEZu1BPpQiUJsVlAu63Y3Q0J0as=;
 b=VFapM4S61GN+qB2G5Awgz4EuZ7yRQpW5xmyqY4EJy7hgZoOhboT6a+qHK2PqxWCkPL
 15ScBNmaZczxsVO7e/1c/O8157kJf7c92iQ/OqMSa8nhIBDY83MpZ0Ki8V9hsjWm3Y7v
 npbBYYyr5TXyszywUTBOjvyfEZAwVoXy3f2SEyfm4e8a2jbCEfu/qHiw7wRFnEpTEaYq
 zgiOTzbBMglOZpVMB8HECsv1kJLFGama3c33LH/ik4ZF0HfUzSX4cSAoETRuSnYqwFQb
 nUcwvSC1VuaB12z/gvbu/rG/UavbB2tDo/xCdpDmsfvScfii2ye+BDlVO4Ayx0qGOW4N
 uLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=RkwkVNo4DaOAeSezSEZu1BPpQiUJsVlAu63Y3Q0J0as=;
 b=C6rHiqK++3jnVS164NQSQgISaD3v1rRv1AenpHwA4Wo+8f756Ut/u8r+nwoH7ej0as
 zsa0UNHJE6x4gBZnVHDtaYHx6+7WUmkEMPYRKqxT6YFpKtwjH+KWw9hNBDaOFSt4Bbfm
 Ex50WA083PfhxnKluSfkWBpQuEqMSwmAOrD7jM16EtKmk9N/0qNLEEyLxmpOvTOBgg0D
 R0Eij1dOBEFK4H7exhzwrgzL4UA2bgQfvfcHwXlmjZIGyrtv0fVGaHROJaygz2KVA8Sf
 nc679B6m6CXQnK3j15oG8/RuqVYUYfsiDm1vogZqfwXjCoj8uWdKzT2NSE3eMKoORiej
 kvsA==
X-Gm-Message-State: APjAAAXQ5I8MHKCRhz+KbGuoVWZEA4vfUjf2Y6YEX1liojA79wmgZDRQ
 XdCRgXahW0H/xrFHgvM5JHw=
X-Google-Smtp-Source: APXvYqzhU0q+xAJJr+wkGRKHfJ7wM4m07WOVr8SelRqPTAl8YrGIJfpYwR3QkiLJFS/jJUK2djjF0A==
X-Received: by 2002:a17:90a:35c8:: with SMTP id
 r66mr20779605pjb.17.1558838571495; 
 Sat, 25 May 2019 19:42:51 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id x16sm6526480pff.30.2019.05.25.19.42.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 19:42:51 -0700 (PDT)
Date: Sun, 26 May 2019 10:42:40 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH] dlpar: Fix a missing-check bug in dlpar_parse_cc_property()
Message-ID: <20190526024240.GA14546@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sun, 26 May 2019 15:29:28 +1000
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
Cc: nfont@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In dlpar_parse_cc_property(), 'prop->name' is allocated by kstrdup().
kstrdup() may return NULL, so it should be checked and handle error.
And prop should be freed if 'prop->name' is NULL.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 1795804..c852024 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -61,6 +61,10 @@ static struct property *dlpar_parse_cc_property(struct cc_workarea *ccwa)
 
 	name = (char *)ccwa + be32_to_cpu(ccwa->name_offset);
 	prop->name = kstrdup(name, GFP_KERNEL);
+	if (!prop->name) {
+		dlpar_free_cc_property(prop);
+		return NULL;
+	}
 
 	prop->length = be32_to_cpu(ccwa->prop_length);
 	value = (char *)ccwa + be32_to_cpu(ccwa->prop_offset);
---
