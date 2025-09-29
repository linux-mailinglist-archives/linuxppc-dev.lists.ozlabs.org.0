Return-Path: <linuxppc-dev+bounces-12619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88770BA891D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 11:16:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZwXY5Cnbz3cZ5;
	Mon, 29 Sep 2025 19:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759137357;
	cv=none; b=N3H0clcvC9gbclI32VVgUlcyRQb4HgMNzxhMff3YHGoVb3ZJwiM9N4nRbzaP+dbV8mO2R+ulFyGERjjxvk+C4kZy6gfovp1wY86QlPPmakRpr1kz3h5CcSvzcPpnIvPE6AmsTIyEmLFeZB6ET6AMjh9+GMkFP56L1ZQFyyMs6JvLxEET5DVYQ7UU/mtjbbjKD51TZoZ/WcJaqWY3DSkztPKtDZRY9HhEV3fnJfdhp97FstIY0VFC3Kvif/0CNYZ1xV8l9jOO0WpFIW3rtXpoHy0FPXD6HZTkdaqdWoztRIxtGF9Npw7+IPtMy0XjHFROCO2FVY4awUF91DI9mHGvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759137357; c=relaxed/relaxed;
	bh=S/ySJWiSpFmZf4ki4sz6ItaQY50Q4llbhd6F9+5mYqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TQSP9OPpmj4EUVYaKP2vHnOj5TlinYdrMRolNP2g+ozcGFgYjQ0NJBNkaj4qkLK2K0sen63Jh+XL0dl7bUpur4jveVvWdbK50n3L1YdQRnDZm0RzbUZAPbaNL1sDUsY2vdfkjsrLw0KHcCZ2aVtYX2I6LuDNKkjw7RyMpHz/INgLFPZR9+FOgt2j8zEFapqyU78hnZOPS+UTOzj1udQ48Bfb2inPSmcpyApm+gvfBy8QhCn3ZC49fgmnacImG6YSOSXTsHV4JhprDyqE1vTQgrOnVAhZUJ12kfJ6M/oH55D8bsompeMdyak+uHmrUVqLnHDKWL+E2VppH7SbeV6zow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.44; helo=mail-ej1-f44.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.44; helo=mail-ej1-f44.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZwXX4fgVz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 19:15:56 +1000 (AEST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b07e3a77b72so896625966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759137352; x=1759742152;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/ySJWiSpFmZf4ki4sz6ItaQY50Q4llbhd6F9+5mYqA=;
        b=GM2ZSmaNUXMOf3b+OnfLO4OxNUJEPL8N6akL8JjTzIH/v3GS6I5l1Ul0FG4UmjTJCw
         emv0JR9czddCsl7urNSEoTAEV9xJDgAdubelktpJQqJ+vfpBhMzyyj9tNG+h2OWd3t1V
         OwXjTQv5khoR1zMtrTnf0MZnTmbK83CmsJM7amWHipIaKL5XqjMt6PkltvZLNaIYGn5/
         6Dqrva3tUe3AUk5vijrCXwnxOlThe8mmZpM8Hn7S7yIe7yzKCsnEmWsRY+m4txWi/trh
         WYmyh5Cgbwmp66UDn8lbNhJiH+5lF3/PnPePGb8PhYAwy0n50f858lusnbQRq80GLIOI
         KpCQ==
X-Gm-Message-State: AOJu0Yx1o/WSAyY2iNBccKXSiUKSI9cuEdZglg0XwsURoU/0gM08cjuR
	QgIcyQ1OqS6zcSTIZCQufccpiYoBfbaJCelHNSe+dnlu8QDOwK4OsQGj
X-Gm-Gg: ASbGncvqhCbMnWDnG9L3Y5UtUnjRw9XjsCP8IudgEWC9UC+T+02GCEqT94CQtlbgi1N
	jz1wFuJvXQ6gKxYjtDinFDzMnZnBx6+FxikrgftjZ5ISkZjihXDd/zvEQvk/vBHnLCVlUqK1mjO
	WamwMlXS/E6fNYs2UH0k9PeOMEzBIVm3xSCmHCGwlALbkXNfOCjd9P5bPM44UZ1e1VooDckuUU0
	EKbvCJKJVCZZGA72zg0WglOqUsDO7kSz3vKN50Dezaxen+bWkA98pMQMTOvWzInrWhnlPWF0Hry
	z0aSrrAxcbwP5H7rM8DUXlUIoTzRK+/reywX9Gcp4g9xpuIrVWlvsoaWwaDqxp803dH9fv8FobX
	71WDDrtHwOhky+94KpH5z7Jts
X-Google-Smtp-Source: AGHT+IEC99o6I5U43x9BBzmjUVvHusJBZH+ekQ9yM0YzCDDYFnPxzInOLc7bxYYRuE1LOgqfOeyByg==
X-Received: by 2002:a17:907:72c2:b0:b2a:10a3:7112 with SMTP id a640c23a62f3a-b354c244b09mr1746488166b.24.1759137352124;
        Mon, 29 Sep 2025 02:15:52 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b401d3d4124sm73171066b.75.2025.09.29.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:15:51 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 29 Sep 2025 02:15:47 -0700
Subject: [PATCH RESEND] PCI/AER: Check for NULL aer_info before
 ratelimiting in pci_print_aer()
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
X-B4-Tracking: v=1; b=H4sIAEJO2mgC/1XNsQqDMBCA4VcJN5tyF1TEqUNdO7RjEYnJqbdou
 RRpEd+9IF06//D9GyRW4QS12UB5lSTLDLWhzECY/DyylQi1AYeuwArJetYuqE9T52zvKATHA0Z
 EyAw8lQd5H9oDbs29uV6gzQxMkl6Lfo7JSkf9efmft5IlO0Qsi9IFqnx+jtyLn0+LjtDu+/4FS
 7EPWq8AAAA=
X-Change-ID: 20250801-aer_crash_2-b21cc2ef0d00
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=leitao@debian.org;
 h=from:subject:message-id; bh=R9u55K8LEYMCF9T8YoRD0SE7dnNGouw1ZbsiBle69qs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBo2k5GJj10pwZeQhabxuZAbcMVQsml8bUkcz4E+
 uow6oJeyWuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaNpORgAKCRA1o5Of/Hh3
 bernD/wLDmkL54OkzUb+m61lGMHj30To7QCHn/pKBW3LjFUzHdsfPC/WPjAtG16FZUFGQD373ko
 vqogdRC36R/Cd3umTq7Rw+Vg0rKhmqaqdfGsKmWUQyNgDI3XwmKmNnBFHfWfMjAOi8bSjsN9PNj
 Y3cML4P2gFuQGkdhAcI/Hhyc43UvRAqZB/T2R+4uz/jQdi+6Icg0qPVzMOw6/AIhg6QPStFayZl
 9c8/LNHcphpjuH8MMz7H1PPEb5dkpotusBK20Wzakvo0rhtUhN/GDprXoILypTRlTlstl97JVSd
 3sdj8/maZdbMNLtcT1LFNqRg40L41Sfb2X8a90aIJe2JHnRKfiy4ja/ISGeOgc9fG0D9YCA3o8z
 rZTKK7jLhgd9hrkTp77nI6/gDoiKU/g5XXHYCtA5AEiD9mFFXW+2d/3UCm9+M9VJdKbdIpxU+8y
 HFVCz2x4TKz9vr2tNea2Md9/m1GUhriYdrOKT/qj7FUpt8/dKZwsIi99BYyul1P42u4UXerh6Hn
 j5UfcNFRODwlmCq+62PsRjUZ13UWAQK5CGgS5OGj/lslHqNmocE822/74Y66pITfKBAzun4FaUz
 XOOcyLobFtZQJVjhSnHcuAureBrxPBESEGKI31kGTArSOMVm4yhrp8ilJIWkI0O9OVKyUzf1dAf
 jPjB5zbIZkILgqA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
does not rate limit, given this is fatal.

This prevents a kernel crash triggered by dereferencing a NULL pointer
in aer_ratelimit(), ensuring safer handling of PCI devices that lack
AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
which already performs this NULL check.

Cc: stable@vger.kernel.org
Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
- This problem is still happening in upstream, and unfortunately no action
  was done in the previous discussion.
- Link to previous post:
  https://lore.kernel.org/r/20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org
---
 drivers/pci/pcie/aer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d7167..55abc5e17b8b1 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 
 static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 {
+	if (!dev->aer_info)
+		return 1;
+
 	switch (severity) {
 	case AER_NONFATAL:
 		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250801-aer_crash_2-b21cc2ef0d00

Best regards,
--  
Breno Leitao <leitao@debian.org>


