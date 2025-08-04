Return-Path: <linuxppc-dev+bounces-10559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68355B19EA5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 11:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwWDb1LBDz30Yb;
	Mon,  4 Aug 2025 19:17:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754299071;
	cv=none; b=SRYZ3UNLnjLMCCO+2WQ4mP4/j3uPbnBb0UJxAL7LUNzFZ7ZBLZOM0z/C5ygXtBpU3I+r+jeVihk94ysRsGOYeIaj+5057rnie8NV8sfmI4Y7g82wJZHqTKBHVaVs5DM9E67N2Bor1O8B1JuOSlHRZGX3FC5G4jLqN+W5Xj5i1ZSGaeCXENxaEggSWiivIAuDiqsQqOrZwK/ze5Pjq2XgKzOGUXYpZIxS2t9EqRBwY0KCJKXzySrnnYuqoXzW9jvDcJDQbgp0qOK3413VwTl+n48dqI6stigS2T1Kr5wI4TbNHlbwVHLwvZl4kDXtApSE43k6lZbYnK/UQK43eBNAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754299071; c=relaxed/relaxed;
	bh=xamvBtEdKuAbOd1z+jRRJHYAkrTu7JX4mmKkjKPIws0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Av8DsHx6BoRWC8J6r2voEIp11SzwfRhuSA9W4BcdVTPwKmQ5obpqU2UgfPa131s1YP07SmrsRauz5I3S/ykjR7/W3VoQkZ6cmhijRUgbPtSkdJ+g1KgCxjhIXg4jaVT8DjpRGVtrQRNItrDlx8LChMApGEzAw/OqvLNzaBh9tqPjeBNN5J48UaKeXRIJwdRhlKzrL1qWlmHe0C6yAEXVL2Lr3CkygItPJ4aOgMLv4ciiuKnMTH1KNszfAhvpfInTiFS8XBVaHPaG1uLpfv6LaZ8fvsHPvAH1QCHPvNRSuQ16ZnMBXARWSeBvHb2YxFsspWlKKlHE9JLuloU7Vsg1EA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.53; helo=mail-ej1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.53; helo=mail-ej1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwWDY5SnRz3069
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 19:17:48 +1000 (AEST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adfb562266cso671454566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 02:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754299065; x=1754903865;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xamvBtEdKuAbOd1z+jRRJHYAkrTu7JX4mmKkjKPIws0=;
        b=fac1WqqMm2jP6vOqKF3J9osf8xuo1k7lcvUzr37LFJRIdRfK2Gh9wCObZV8Yx0BQmN
         1oPYYJwCMceR8WGdHrHqwcmkLyDiFSI8OOIo/qwhnP2eEwVJ2NTb7NrGvFABbuyLCT/M
         tdDJcJv/VmC2dF5A22nyjcA0wgmAO7/xAR3s7cUFGhMkMnIj+GyERcDk/jaZEMy6dO3Q
         5355SwL3gQVwEQ52RfZyJkqaVG4UEO0Ag3oCN7MJ7CZleRGh8voIQYgEMI+eRl+k6d5y
         Gm7xpfWvcdbi5OwaijLV2W1D5aGkqz7q6dzdS/mzNg4hxpeZqozMnMEitIso8NSV2IpX
         nYtg==
X-Gm-Message-State: AOJu0YxvdYuO/OLHMDKhPWMGos/DQJwwclDeM49s4/4AfdC6mn5Jx1dq
	tkznH5zyYchWpTWg76VxTJBuMkpTmqBvuRIZXdztiG/zzRwiDLPdUo8v
X-Gm-Gg: ASbGncvhis66D1J1QNEPbEqw6dKxniqjSAc7/hj5R+0STRAZ28vwqYqn7H2dmhiQ+yw
	GP8+hzdxcrfXGvzwiSkThY3q3JsvS7zHxxDcUL3DwcwhQDV85pcyR7Eei7ajRjR5SCwZhUHCfj4
	sV4nMVIJDzH/36dO1j0oq4V4mYfH4agFeuuOZBWBzxnu3cAj9SJ6jxtvQXzcpRi54h5EopHfNbp
	B6mg93HnR9dHaFsdgA9ww7OHi0CWnk1lY8ZGl994PaCiF7Yv1DU1o9wf+NfoPyy5C/IdZt6Ex5I
	VvXYaEC6VejKCTUPat4f+gc6ODMDrYNX6Sya4FGcjzMkQkqrRkYhcL1IBORKcAK2UlOV1RizUWu
	++pcRmZ+MStup
X-Google-Smtp-Source: AGHT+IEbHhIr5xiJI4WCsuusUsNAMV+ToZt7UWotIYnSTg2xxYU2vexFSF+WiWH8cmp0UryOEkWQ3w==
X-Received: by 2002:a17:907:8688:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-af94008422dmr1005072366b.18.1754299064846;
        Mon, 04 Aug 2025 02:17:44 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm703510666b.111.2025.08.04.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:17:44 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 04 Aug 2025 02:17:22 -0700
Subject: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
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
Message-Id: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
X-B4-Tracking: v=1; b=H4sIAKF6kGgC/x3M0QmAMAwFwFXC+7aQBgTpKiJSa9T8qKQggri74
 A1wD6q6aUWiB66XVTt2JIoNoWx5XzXYjEQQlpY7jiGrj8Vz3UYJk8RSRBeemdEQTtfF7n/rh/f
 9AKuzfaNdAAAA
X-Change-ID: 20250801-aer_crash_2-b21cc2ef0d00
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=leitao@debian.org;
 h=from:subject:message-id; bh=i0OFIqRZ+2MCROlqNGaAy7Gthq89bO35bHAcnJh3VlA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBokHq3J6RaxpQfmijCmhT8xwiAfy7q4+tdEwFP4
 yJyxN2RFW6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaJB6twAKCRA1o5Of/Hh3
 bQd3D/405/+BXCq8MZtdnT0v0HPlyz++xhl/hpeSOvxquiUiEEfkaHiUL2uqGxGtZtApFaz24gn
 JXC6Ncm8AhRJWEcLw0n830Iuo+eE+UOLzV9LVe3tJG0mrs05AMXRzKIB9gC1qAhWeCY/mcd7ZaO
 hMgXwO4gEuhKA6wAJBqwKo/NYaTNsWj/rWxwqnjYBWC1GW0CPAk/lBVVww+0RGKx1WJIZAmRVxB
 /fEecTarqVnj0ouyvEc2763i6GMm2AhDnNdDQ8qCMN6qH6EPWnEbflBEbVgKVetq2YqrbaFGvGe
 wv/ULHHRlR/HNb4K7YJmTjUeg164O6RWtwJwU6UoHQXIwqJ+hig4UznuTRFbS7UV9x+Rg0+x8P5
 /V35p2mr49zxy1OhQRp4+olU2Y+d/bARyi4Se5hxXZU41d2qlzSaKIiwSWXmyhcHaScUZNz2CPy
 Be+BcociZDT/+b1CDjtImSEZ0+kWMihnXlhSPbgM+TfwZA3quoFcMK/DXdEjSpWQTDyCLx3GHYN
 E+vpmi0oueXyU+j98iYBOJ42zeyvxHJk5heWaqkxmR7XRrpYAdNdp3XVM/z+HFW9VCCJ51aSl1H
 wPd2WKlvGnRMSeqH490icMf0RRGqATNaJoeOL3Y/NQZjCL4bt4cHL+arcgZ7+kYsOQdt+XnWkuK
 lxgZ3D9L1RwM4MQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
does not rate limit, given this is fatal.

This prevents a kernel crash triggered by dereferencing a NULL pointer
in aer_ratelimit(), ensuring safer handling of PCI devices that lack
AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
which already performs this NULL check.

Signed-off-by: Breno Leitao <leitao@debian.org>
Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
---
 drivers/pci/pcie/aer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 70ac661883672..b5f96fde4dcda 100644
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
base-commit: 89748acdf226fd1a8775ff6fa2703f8412b286c8
change-id: 20250801-aer_crash_2-b21cc2ef0d00

Best regards,
--  
Breno Leitao <leitao@debian.org>


