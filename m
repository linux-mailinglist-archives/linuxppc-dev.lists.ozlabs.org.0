Return-Path: <linuxppc-dev+bounces-15032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C94CE02C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8Z3R1hz2yN2;
	Sun, 28 Dec 2025 09:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837955;
	cv=none; b=lBRyZoyM9scppG4TkT9IEcpARM0WjzV1O8iTE3ejgnG7LNLeFQ8DW+tSjMN9L7tA1kS9ZVYo3A707ph+xY5BNogLlYqJUWyjvnxbgw7jjQz/Wl6U5EB5GWnX0ehXWNspV1EgYq40y8Etv7Kx7SnhPbfGYzwHSf8SGCZoEgi9y/708G9q7qJKfWIGsry4T7kxiIJ907EdK4vFg4LapzmCIY5d/2UNee3y8IbkuB8/FVHq7UgEzoRWpdKivQW4RgUD0qoRpfjOfwX6quAe4Wka8QDMdtFkiCGikH68kT9ZUfRdt/hw1KdMjblnGRVyMXE9JRge2Kq4yCy/7nR9+Kkzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837955; c=relaxed/relaxed;
	bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHiu471I1oogpx01GZ4LBYVVjq/LM+0QuWSzAhnkgQrVaKs7+iQcBNP916qtpKUI8sREf9k9i7bEDlx4M37sXID42OuEnahnS34JlOPEfSzM6RUtzJRMRrGhpq4MMT/lmvaitftHrHHLZHRDqdpuDx5E67rfRctC+kTbVlU3CFs5h+PV3ZPmuI4suhkswVhD2LyfPXkMa/2WHF5PUPTrAudf/S9RBBN6BG+aWnVeL76qhLXpfLWIkYpThk0vXiYNR92aX1xLZ58IXWcix2sp9gqT1ljyMnHQTGd40gJsNiTQm0JmCEYz+9HeiItX5Yq0RxecNgRP7myicOrGRd2ghw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=biO1Pl+B; dkim-atps=neutral; spf=pass (client-ip=209.85.128.44; helo=mail-wm1-f44.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=biO1Pl+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.44; helo=mail-wm1-f44.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhNx73v4z2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:13 +1100 (AEDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61935645e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837891; x=1767442691; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
        b=biO1Pl+BZCXL4TzCTzuBzXUXI5kzWmwP+CeGSJbrTLh4dMfAFcnsjlM6FXdF1GLkOb
         Lxu4FBU5D9IsnqPfpRkqreYI2tgjEJ3SzHjnqMTbO/YfslGtVkLIFVPvN+vXlDvvhU52
         oK50YHDinX7wjUDI67pDUDgLJV0njz7igW92gcHfjOryjsgPlY9kTdBYBMs65Vcr0aYl
         7RFusjdFOc9kq/zf7+WxVnkQWhi7YfMBkTsZRLhpFULyW8tXKJmKvmh9N/aCWSe/qDBN
         +X1zpsp7Pftd/5hK4h8g+7hY+FRxmX/CCr7avL3t91uOy+Vh4bZtmisz8aCv6n8BHDF4
         mC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837891; x=1767442691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
        b=YjTrzKfYl5ckyHR8VaPzl2aTvmRYZe57DBlE9KaG/2hvVG9pmkuYew077MMmHj46lX
         B8ExXFT/QMxvJJN9wuQyZwCygOXzFFTgJXlHPGU5bSv586oVew7l5R+SUIsUAEzCACFT
         zBLjUmpGUDyhbr7LGD81DulyenkvLzqKMLSZBJmwt3aYDxDX+GIEP5F9FNRxed7apK9Z
         nN0X/i57ScBoTOlOkmFuWvWZmNKvsTYsio5mPaBgvIIDc1RhtI1f321X6/AjJV2E5TtV
         E8B0PzyI/Q+My6b6dOGn36gOQRFgxPqcgVwDmDj3vGuJg229UlAx/jtmRPYVK6FD9Kno
         gAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUthWbeTlbzjUxV8woOLOH3qdemlxgVr3GvhDDcZdZexl/WyiCnDlcW3ycESYEA1LvI3JDRfewDJkpwcB0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcH4mcj+du0fzNhOtAkaK3lHmCeiw2Odhg0KpjfsIOmjGRHgqs
	yTV0WzbOvgQElIHKI+AaT1KW8QvjDm5IhH3o5f3uP6CYh8D4KBOB50wHLXNiyb3+eSs=
X-Gm-Gg: AY/fxX6lNc2L4P20kk8OfazNUbF+V7RFVO6OMo6B3kzNVobyS/2Wjfqq5l/PQDh2SVF
	uAJnKyLFsj1tsWS3/U0Y2T/hNdS/dLAr3hgQ2vgx/CQHvw71qpWOFqU3xHdrhoNbcnioEGLTkEC
	3he4jVRJ56wZlJPIE26yToTdhS2rqBLU6CfQN7qYjmbEbA8rF1J6VPmlokf2MRPEq9dzuRHRsFD
	710DXPeLHAkQztNqUWMvFXdtQPejKW9O3LMzEM+kGo/XPW0coJAxbD69GrRpQzcbsD8H406A3JP
	5r9dGSjBVVhptXnfZ/CGa7bq5EiV0pZHPxgQx9HyhyDIl9UacudMaglYkipl8fdsVblznyKemTU
	INdVcrY2d6aQS2ll6aH/K09P3rJvBNtaKkWEhzI6XiNlaOe4X/3R7K7K23YCcd5vowujBGAVlUw
	0wSoZavLcg
X-Google-Smtp-Source: AGHT+IFJeR5Bq3e314KIMXwkrZhqd3SM0Gtgef2ZKhyuTvMEsyAQgTg0idlkENoTE/A1RwLAaI6A4g==
X-Received: by 2002:a05:600c:a30f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47d52efc7bdmr6320155e9.1.1766837890917;
        Sat, 27 Dec 2025 04:18:10 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:10 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:16 -0300
Subject: [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
 register_console_force helper
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
Message-Id: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=997;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=aTPPRUdelJJPNRSRbq/P3Dh/ezSRl1NcFqsysqipRcI=;
 b=bFiYD37gtcultSa+DtuWsZDZsqldtTEWNQGlnO3f8qpUTnHo9LyYg6/jnVTrFnBYz5Wno6rCP
 MIg9mT6KNXdApenqW2Pg83sbMRC0cE454dAXf3m0peqNYruoithEiNk
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/m68k/emu/nfcon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index d41260672e24..3504bbb4aedc 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -110,10 +110,9 @@ static int __init nf_debug_setup(char *arg)
 		/*
 		 * The console will be enabled when debug=nfcon is specified
 		 * as a kernel parameter. Since this is a non-standard way
-		 * of enabling consoles, it must be explicitly enabled.
+		 * of enabling consoles, it must be explicitly forced.
 		 */
-		nf_console.flags |= CON_ENABLED;
-		register_console(&nf_console);
+		register_console_force(&nf_console);
 	}
 
 	return 0;

-- 
2.52.0


