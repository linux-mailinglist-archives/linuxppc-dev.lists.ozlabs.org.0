Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BF21E896
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:49:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5WNC39xtzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D6enXb3M; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5WJZ74G2zDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:46:38 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id l6so14645530qkc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=dzxfeYMtkjsMRhuGgWk+6usvf7YkNVFphbzmaI9AE80=;
 b=D6enXb3MQ6lRfQoiLzp7fWvveVWEPafnRj0qOq8HR749w3FZ37ez2NYcHDpWVcNJ8C
 E6oilKdejmb5r0rqLFJB+CCLpscI8XUiIVZ8bDM7z6I/7R0PfB+60Ow/jN3FMTFb+aqf
 VIHAGF84TrYoYpJzXubl8z4dY24kY+GAm+G0m27ZFHu72vmK0NVCiy4kSnFIwVT401mB
 pkAFtMTtLD4gEXq7awDLySJq5spWEL2tFvchp9MVLxoMnoF7vhSgssNg+M6z59ENUxiH
 RLqIUZYFM3dl6pT13dxMsHSTwb+OG1YiOQOwRreOhSXvfmOqJOBWL9iUxFa+QBQb4eC8
 ukrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dzxfeYMtkjsMRhuGgWk+6usvf7YkNVFphbzmaI9AE80=;
 b=ABcg3IYjWJpXNqzXpPh8c08gCNZn4eTdivvpIZe0YOVhpO+eXQ+oUxTI/SfVj9LoKn
 xCCzFy5KReyvV51HekiyNQz4fEkotCwchFpewOyqUv05dfsQfMU/chtzdKt/hSB9gPng
 2gBRQGXNp+rugrUSVKLCwQ5qHYFNBcI2Os+NyBNPlkd5LGHCjETEVF+PYblyVPI/Gl6O
 fRJws2WEuU43oxRlCc6I1Z2S70kedSTBDbdMAUfVIssO96CTXgZgJ+47Sphez5GSxK6/
 RgWS/k7H/ETvPSx3J2CnIG0rxdzXhv/kg6/ae/W7JEu+3yu/rUP1KuzOSKbjQ6+wbhKT
 ljag==
X-Gm-Message-State: AOAM531G2oMSiL2xCP66maIxKhq0JfGTSiCE0oUXkiAVpQra381DhAd8
 t9Ql9lfyh2Qw3MUTysjxIdQ=
X-Google-Smtp-Source: ABdhPJyC3/V/9okdvc0CGcOc+6fmRvKD6sJ98UlaqvKOZ2nYA2QIkbbrDx8NW6BywsBA4Kr4BtJlsQ==
X-Received: by 2002:a37:4bcd:: with SMTP id y196mr3029955qka.495.1594709195156; 
 Mon, 13 Jul 2020 23:46:35 -0700 (PDT)
Received: from LeoBras (179-125-193-229.dynamic.desktop.com.br.
 [179.125.193.229])
 by smtp.gmail.com with ESMTPSA id a68sm20906352qkc.110.2020.07.13.23.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 23:46:34 -0700 (PDT)
Message-ID: <846ba63b1f1fc4c9366f39b2cf09df71a19da891.camel@gmail.com>
Subject: Re: [PATCH v3 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Tue, 14 Jul 2020 03:46:29 -0300
In-Reply-To: <eb357d42f5605a2b0234c04de477e171134c24f5.camel@gmail.com>
References: <20200703061844.111865-1-leobras.c@gmail.com>
 <20200703061844.111865-5-leobras.c@gmail.com>
 <cc15a81d-04d9-3ee4-4fdb-093618f6e635@ozlabs.ru>
 <8c29be499e8741e7d77d53ca005034a2ca0179ac.camel@gmail.com>
 <18fd94d2-4365-16d1-7c85-af07d5c9a0f3@ozlabs.ru>
 <eb357d42f5605a2b0234c04de477e171134c24f5.camel@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In fact, the changes over the last patch are more complex than the
current patch. 
Just for reference, that's how enable_ddw() currently patches:

@@ -1087,7 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct
device_node *pdn)
        struct device_node *dn;
        u32 ddw_avail[DDW_APPLICABLE_SIZE];
        struct direct_window *window;
-       struct property *win64;
+       struct property *win64, *default_win = NULL;
        struct dynamic_dma_window_prop *ddwprop;
        struct failed_ddw_pdn *fpdn;
 
@@ -1133,14 +1165,38 @@ static u64 enable_ddw(struct pci_dev *dev,
struct device_node *pdn)
        if (ret != 0)
                goto out_failed;
 
+       /*
+        * If there is no window available, remove the default DMA
window,
+        * if it's present. This will make all the resources available
to the
+        * new DDW window.
+        * If anything fails after this, we need to restore it, so also
check
+        * for extensions presence.
+        */
        if (query.windows_available == 0) {
-               /*
-                * no additional windows are available for this device.
-                * We might be able to reallocate the existing window,
-                * trading in for a larger page size.
-                */
-               dev_dbg(&dev->dev, "no free dynamic windows");
-               goto out_failed;
+               int reset_win_ext;
+
+               default_win = of_find_property(pdn, "ibm,dma-window",
NULL);
+               if (!default_win)
+                       goto out_failed;
+
+               reset_win_ext = ddw_read_ext(pdn,
DDW_EXT_RESET_DMA_WIN, NULL);
+               if (reset_win_ext) {
+                       default_win = NULL;
+                       goto out_failed;
+               }
+
+               remove_dma_window(pdn, ddw_avail, default_win);
+
+               /* Query again, to check if the window is available */
+               ret = query_ddw(dev, ddw_avail, &query, pdn);
+               if (ret != 0)
+                       goto out_failed;
+
+               if (query.windows_available == 0) {
+                       /* no windows are available for this device. */
+                       dev_dbg(&dev->dev, "no free dynamic windows");
+                       goto out_failed;
+               }
        }
        if (query.page_size & 4) {
                page_shift = 24; /* 16MB */
@@ -1231,6 +1287,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct
device_node *pdn)
        kfree(win64);
 
 out_failed:
+       if (default_win)
+               reset_dma_window(dev, pdn);
 
        fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
        if (!fpdn)

