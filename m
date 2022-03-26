Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C215C4E836F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:42:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnrl4Z0hz3bM7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:42:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=M77RWik2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=tXpt+IhL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=M77RWik2; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=tXpt+IhL; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlbQ2MY8z306h
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:06 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 4596FFBBE9; Sat, 26 Mar 2022 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314064; bh=jxDxg/1YvnjqAgGyMWNqdP+FITcJYQ18irrEetjPgmg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M77RWik2RAbKDVPfjK4dF/evFOHlTGsPmnYHcb9C7ds681Y29qUsE8/2RU136Hg3V
 2JysXnEsExj7qdtTURbiLLN1VgnvNF0O3vFv0TZeZC+OvwsNyFqeVnaTcLwECRPKZ/
 NDolV6yo0INbvH5mV00nsBwc36g3sdOxTmZCjXFcYXdsSHI80ta3hcbpyr22FQqV40
 tTxrPCXE1XZ6zLAQpSkuttN2jnVYziMLZt+KZMeNrPnuWgpZuFrKZje59SOUtAkqgK
 g1rAvBmm/vYJihbDHswl/0IdR7XSGIS/Z9l5Nr16g/Yl3QPnjRAVRCATIujxuJH7b4
 6CcxateRv+JSw==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 5A410FBB90;
 Sat, 26 Mar 2022 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314059; bh=jxDxg/1YvnjqAgGyMWNqdP+FITcJYQ18irrEetjPgmg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tXpt+IhLwa3r7XX0620zIigtIlnPC5xjiq95/LVELm23jTciuM25sR08Ztrd40v1r
 46H/DjtI8rIQ2xi/gRAXwCvmPTq6/DbQ1rpy7fj0Vuao1qVFTdpDhTfnVBw9EdYmjk
 CunLFGlQwefmtYfgcNTZCLxoR31e/3Nty30QSTIV0qkb0iUAhnfvj9R8Sdm1+LEwIG
 Xqdg9YreMxCBjbYZckXfJoJbis0+cq5CSGojri7tQBzI4CXGBtmS6vThgpZ6eoTh00
 t9YPO3gJZp4QQ42EGkIJWAH3PiQIlzfb6tGFFiGErqjnRnuTRqgCAMCxupvZXNeFnU
 MH0256oFmRaQw==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 15/22] macintosh: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:02 +0100
Message-Id: <20220326165909.506926-15-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 drivers/macintosh/adbhid.c | 256 ++++++++++++++++++-------------------
 1 file changed, 128 insertions(+), 128 deletions(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index 994ba5cb3678..6e44623cf084 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -77,134 +77,134 @@ static struct notifier_block adbhid_adb_notifier = {
 #define ADB_KEY_POWER		0x7f
 
 static const u16 adb_to_linux_keycodes[128] = {
-	/* 0x00 */ KEY_A, 		/*  30 */
-	/* 0x01 */ KEY_S, 		/*  31 */
-	/* 0x02 */ KEY_D,		/*  32 */
-	/* 0x03 */ KEY_F,		/*  33 */
-	/* 0x04 */ KEY_H,		/*  35 */
-	/* 0x05 */ KEY_G,		/*  34 */
-	/* 0x06 */ KEY_Z,		/*  44 */
-	/* 0x07 */ KEY_X,		/*  45 */
-	/* 0x08 */ KEY_C,		/*  46 */
-	/* 0x09 */ KEY_V,		/*  47 */
-	/* 0x0a */ KEY_102ND,		/*  86 */
-	/* 0x0b */ KEY_B,		/*  48 */
-	/* 0x0c */ KEY_Q,		/*  16 */
-	/* 0x0d */ KEY_W,		/*  17 */
-	/* 0x0e */ KEY_E,		/*  18 */
-	/* 0x0f */ KEY_R,		/*  19 */
-	/* 0x10 */ KEY_Y,		/*  21 */
-	/* 0x11 */ KEY_T,		/*  20 */
-	/* 0x12 */ KEY_1,		/*   2 */
-	/* 0x13 */ KEY_2,		/*   3 */
-	/* 0x14 */ KEY_3,		/*   4 */
-	/* 0x15 */ KEY_4,		/*   5 */
-	/* 0x16 */ KEY_6,		/*   7 */
-	/* 0x17 */ KEY_5,		/*   6 */
-	/* 0x18 */ KEY_EQUAL,		/*  13 */
-	/* 0x19 */ KEY_9,		/*  10 */
-	/* 0x1a */ KEY_7,		/*   8 */
-	/* 0x1b */ KEY_MINUS,		/*  12 */
-	/* 0x1c */ KEY_8,		/*   9 */
-	/* 0x1d */ KEY_0,		/*  11 */
-	/* 0x1e */ KEY_RIGHTBRACE,	/*  27 */
-	/* 0x1f */ KEY_O,		/*  24 */
-	/* 0x20 */ KEY_U,		/*  22 */
-	/* 0x21 */ KEY_LEFTBRACE,	/*  26 */
-	/* 0x22 */ KEY_I,		/*  23 */
-	/* 0x23 */ KEY_P,		/*  25 */
-	/* 0x24 */ KEY_ENTER,		/*  28 */
-	/* 0x25 */ KEY_L,		/*  38 */
-	/* 0x26 */ KEY_J,		/*  36 */
-	/* 0x27 */ KEY_APOSTROPHE,	/*  40 */
-	/* 0x28 */ KEY_K,		/*  37 */
-	/* 0x29 */ KEY_SEMICOLON,	/*  39 */
-	/* 0x2a */ KEY_BACKSLASH,	/*  43 */
-	/* 0x2b */ KEY_COMMA,		/*  51 */
-	/* 0x2c */ KEY_SLASH,		/*  53 */
-	/* 0x2d */ KEY_N,		/*  49 */
-	/* 0x2e */ KEY_M,		/*  50 */
-	/* 0x2f */ KEY_DOT,		/*  52 */
-	/* 0x30 */ KEY_TAB,		/*  15 */
-	/* 0x31 */ KEY_SPACE,		/*  57 */
-	/* 0x32 */ KEY_GRAVE,		/*  41 */
-	/* 0x33 */ KEY_BACKSPACE,	/*  14 */
-	/* 0x34 */ KEY_KPENTER,		/*  96 */
-	/* 0x35 */ KEY_ESC,		/*   1 */
-	/* 0x36 */ KEY_LEFTCTRL,	/*  29 */
-	/* 0x37 */ KEY_LEFTMETA,	/* 125 */
-	/* 0x38 */ KEY_LEFTSHIFT,	/*  42 */
-	/* 0x39 */ KEY_CAPSLOCK,	/*  58 */
-	/* 0x3a */ KEY_LEFTALT,		/*  56 */
-	/* 0x3b */ KEY_LEFT,		/* 105 */
-	/* 0x3c */ KEY_RIGHT,		/* 106 */
-	/* 0x3d */ KEY_DOWN,		/* 108 */
-	/* 0x3e */ KEY_UP,		/* 103 */
-	/* 0x3f */ KEY_FN,		/* 0x1d0 */
-	/* 0x40 */ 0,
-	/* 0x41 */ KEY_KPDOT,		/*  83 */
-	/* 0x42 */ 0,
-	/* 0x43 */ KEY_KPASTERISK,	/*  55 */
-	/* 0x44 */ 0,
-	/* 0x45 */ KEY_KPPLUS,		/*  78 */
-	/* 0x46 */ 0,
-	/* 0x47 */ KEY_NUMLOCK,		/*  69 */
-	/* 0x48 */ 0,
-	/* 0x49 */ 0,
-	/* 0x4a */ 0,
-	/* 0x4b */ KEY_KPSLASH,		/*  98 */
-	/* 0x4c */ KEY_KPENTER,		/*  96 */
-	/* 0x4d */ 0,
-	/* 0x4e */ KEY_KPMINUS,		/*  74 */
-	/* 0x4f */ 0,
-	/* 0x50 */ 0,
-	/* 0x51 */ KEY_KPEQUAL,		/* 117 */
-	/* 0x52 */ KEY_KP0,		/*  82 */
-	/* 0x53 */ KEY_KP1,		/*  79 */
-	/* 0x54 */ KEY_KP2,		/*  80 */
-	/* 0x55 */ KEY_KP3,		/*  81 */
-	/* 0x56 */ KEY_KP4,		/*  75 */
-	/* 0x57 */ KEY_KP5,		/*  76 */
-	/* 0x58 */ KEY_KP6,		/*  77 */
-	/* 0x59 */ KEY_KP7,		/*  71 */
-	/* 0x5a */ 0,
-	/* 0x5b */ KEY_KP8,		/*  72 */
-	/* 0x5c */ KEY_KP9,		/*  73 */
-	/* 0x5d */ KEY_YEN,		/* 124 */
-	/* 0x5e */ KEY_RO,		/*  89 */
-	/* 0x5f */ KEY_KPCOMMA,		/* 121 */
-	/* 0x60 */ KEY_F5,		/*  63 */
-	/* 0x61 */ KEY_F6,		/*  64 */
-	/* 0x62 */ KEY_F7,		/*  65 */
-	/* 0x63 */ KEY_F3,		/*  61 */
-	/* 0x64 */ KEY_F8,		/*  66 */
-	/* 0x65 */ KEY_F9,		/*  67 */
-	/* 0x66 */ KEY_HANJA,		/* 123 */
-	/* 0x67 */ KEY_F11,		/*  87 */
-	/* 0x68 */ KEY_HANGEUL,		/* 122 */
-	/* 0x69 */ KEY_SYSRQ,		/*  99 */
-	/* 0x6a */ 0,
-	/* 0x6b */ KEY_SCROLLLOCK,	/*  70 */
-	/* 0x6c */ 0,
-	/* 0x6d */ KEY_F10,		/*  68 */
-	/* 0x6e */ KEY_COMPOSE,		/* 127 */
-	/* 0x6f */ KEY_F12,		/*  88 */
-	/* 0x70 */ 0,
-	/* 0x71 */ KEY_PAUSE,		/* 119 */
-	/* 0x72 */ KEY_INSERT,		/* 110 */
-	/* 0x73 */ KEY_HOME,		/* 102 */
-	/* 0x74 */ KEY_PAGEUP,		/* 104 */
-	/* 0x75 */ KEY_DELETE,		/* 111 */
-	/* 0x76 */ KEY_F4,		/*  62 */
-	/* 0x77 */ KEY_END,		/* 107 */
-	/* 0x78 */ KEY_F2,		/*  60 */
-	/* 0x79 */ KEY_PAGEDOWN,	/* 109 */
-	/* 0x7a */ KEY_F1,		/*  59 */
-	/* 0x7b */ KEY_RIGHTSHIFT,	/*  54 */
-	/* 0x7c */ KEY_RIGHTALT,	/* 100 */
-	/* 0x7d */ KEY_RIGHTCTRL,	/*  97 */
-	/* 0x7e */ KEY_RIGHTMETA,	/* 126 */
-	/* 0x7f */ KEY_POWER,		/* 116 */
+	[0x00] = KEY_A,		      /*  30 */
+	[0x01] = KEY_S,		      /*  31 */
+	[0x02] = KEY_D,		      /*  32 */
+	[0x03] = KEY_F,		      /*  33 */
+	[0x04] = KEY_H,		      /*  35 */
+	[0x05] = KEY_G,		      /*  34 */
+	[0x06] = KEY_Z,		      /*  44 */
+	[0x07] = KEY_X,		      /*  45 */
+	[0x08] = KEY_C,		      /*  46 */
+	[0x09] = KEY_V,		      /*  47 */
+	[0x0a] = KEY_102ND,		   /*  86 */
+	[0x0b] = KEY_B,		      /*  48 */
+	[0x0c] = KEY_Q,		      /*  16 */
+	[0x0d] = KEY_W,		      /*  17 */
+	[0x0e] = KEY_E,		      /*  18 */
+	[0x0f] = KEY_R,		      /*  19 */
+	[0x10] = KEY_Y,		      /*  21 */
+	[0x11] = KEY_T,		      /*  20 */
+	[0x12] = KEY_1,		      /*   2 */
+	[0x13] = KEY_2,		      /*   3 */
+	[0x14] = KEY_3,		      /*   4 */
+	[0x15] = KEY_4,		      /*   5 */
+	[0x16] = KEY_6,		      /*   7 */
+	[0x17] = KEY_5,		      /*   6 */
+	[0x18] = KEY_EQUAL,		   /*  13 */
+	[0x19] = KEY_9,		      /*  10 */
+	[0x1a] = KEY_7,		      /*   8 */
+	[0x1b] = KEY_MINUS,		   /*  12 */
+	[0x1c] = KEY_8,		      /*   9 */
+	[0x1d] = KEY_0,		      /*  11 */
+	[0x1e] = KEY_RIGHTBRACE,	/*  27 */
+	[0x1f] = KEY_O,		      /*  24 */
+	[0x20] = KEY_U,		      /*  22 */
+	[0x21] = KEY_LEFTBRACE,	   /*  26 */
+	[0x22] = KEY_I,		      /*  23 */
+	[0x23] = KEY_P,		      /*  25 */
+	[0x24] = KEY_ENTER,		   /*  28 */
+	[0x25] = KEY_L,		      /*  38 */
+	[0x26] = KEY_J,		      /*  36 */
+	[0x27] = KEY_APOSTROPHE,	/*  40 */
+	[0x28] = KEY_K,		      /*  37 */
+	[0x29] = KEY_SEMICOLON,	   /*  39 */
+	[0x2a] = KEY_BACKSLASH,	   /*  43 */
+	[0x2b] = KEY_COMMA,		   /*  51 */
+	[0x2c] = KEY_SLASH,		   /*  53 */
+	[0x2d] = KEY_N,		      /*  49 */
+	[0x2e] = KEY_M,		      /*  50 */
+	[0x2f] = KEY_DOT,		      /*  52 */
+	[0x30] = KEY_TAB,		      /*  15 */
+	[0x31] = KEY_SPACE,		   /*  57 */
+	[0x32] = KEY_GRAVE,		   /*  41 */
+	[0x33] = KEY_BACKSPACE,	   /*  14 */
+	[0x34] = KEY_KPENTER,		/*  96 */
+	[0x35] = KEY_ESC,		      /*   1 */
+	[0x36] = KEY_LEFTCTRL,	   /*  29 */
+	[0x37] = KEY_LEFTMETA,	   /* 125 */
+	[0x38] = KEY_LEFTSHIFT,	   /*  42 */
+	[0x39] = KEY_CAPSLOCK,	   /*  58 */
+	[0x3a] = KEY_LEFTALT,		/*  56 */
+	[0x3b] = KEY_LEFT,		   /* 105 */
+	[0x3c] = KEY_RIGHT,		   /* 106 */
+	[0x3d] = KEY_DOWN,		   /* 108 */
+	[0x3e] = KEY_UP,		      /* 103 */
+	[0x3f] = KEY_FN,		      /* 0x1d0 */
+	[0x40] = 0,
+	[0x41] = KEY_KPDOT,		   /*  83 */
+	[0x42] = 0,
+	[0x43] = KEY_KPASTERISK,	/*  55 */
+	[0x44] = 0,
+	[0x45] = KEY_KPPLUS,		   /*  78 */
+	[0x46] = 0,
+	[0x47] = KEY_NUMLOCK,		/*  69 */
+	[0x48] = 0,
+	[0x49] = 0,
+	[0x4a] = 0,
+	[0x4b] = KEY_KPSLASH,		/*  98 */
+	[0x4c] = KEY_KPENTER,		/*  96 */
+	[0x4d] = 0,
+	[0x4e] = KEY_KPMINUS,		/*  74 */
+	[0x4f] = 0,
+	[0x50] = 0,
+	[0x51] = KEY_KPEQUAL,		/* 117 */
+	[0x52] = KEY_KP0,		      /*  82 */
+	[0x53] = KEY_KP1,		      /*  79 */
+	[0x54] = KEY_KP2,		      /*  80 */
+	[0x55] = KEY_KP3,		      /*  81 */
+	[0x56] = KEY_KP4,		      /*  75 */
+	[0x57] = KEY_KP5,		      /*  76 */
+	[0x58] = KEY_KP6,		      /*  77 */
+	[0x59] = KEY_KP7,		      /*  71 */
+	[0x5a] = 0,
+	[0x5b] = KEY_KP8,		      /*  72 */
+	[0x5c] = KEY_KP9,		      /*  73 */
+	[0x5d] = KEY_YEN,		      /* 124 */
+	[0x5e] = KEY_RO,		      /*  89 */
+	[0x5f] = KEY_KPCOMMA,		/* 121 */
+	[0x60] = KEY_F5,		      /*  63 */
+	[0x61] = KEY_F6,		      /*  64 */
+	[0x62] = KEY_F7,		      /*  65 */
+	[0x63] = KEY_F3,		      /*  61 */
+	[0x64] = KEY_F8,		      /*  66 */
+	[0x65] = KEY_F9,		      /*  67 */
+	[0x66] = KEY_HANJA,		   /* 123 */
+	[0x67] = KEY_F11,		      /*  87 */
+	[0x68] = KEY_HANGEUL,		/* 122 */
+	[0x69] = KEY_SYSRQ,		   /*  99 */
+	[0x6a] = 0,
+	[0x6b] = KEY_SCROLLLOCK,	/*  70 */
+	[0x6c] = 0,
+	[0x6d] = KEY_F10,		      /*  68 */
+	[0x6e] = KEY_COMPOSE,		/* 127 */
+	[0x6f] = KEY_F12,		      /*  88 */
+	[0x70] = 0,
+	[0x71] = KEY_PAUSE,		   /* 119 */
+	[0x72] = KEY_INSERT,		   /* 110 */
+	[0x73] = KEY_HOME,		   /* 102 */
+	[0x74] = KEY_PAGEUP,		   /* 104 */
+	[0x75] = KEY_DELETE,		   /* 111 */
+	[0x76] = KEY_F4,		      /*  62 */
+	[0x77] = KEY_END,		      /* 107 */
+	[0x78] = KEY_F2,		      /*  60 */
+	[0x79] = KEY_PAGEDOWN,	   /* 109 */
+	[0x7a] = KEY_F1,		      /*  59 */
+	[0x7b] = KEY_RIGHTSHIFT,	/*  54 */
+	[0x7c] = KEY_RIGHTALT,	   /* 100 */
+	[0x7d] = KEY_RIGHTCTRL,	   /*  97 */
+	[0x7e] = KEY_RIGHTMETA,	   /* 126 */
+	[0x7f] = KEY_POWER,		   /* 116 */
 };
 
 struct adbhid {
-- 
2.35.1

