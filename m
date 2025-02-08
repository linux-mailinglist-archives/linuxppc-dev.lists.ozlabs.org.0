Return-Path: <linuxppc-dev+bounces-5995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F15A2D8CA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 22:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yr3Vd55mTz2y8V;
	Sun,  9 Feb 2025 08:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739049241;
	cv=none; b=Boif45JalseERlMhweypNRgEtLbGQ/7oTedoYvXwNkZMYholzzZgPSYKrMU5bkdNNhHDP7CFgs1hoancYo3iV+koJiT7d0Hy1/4ib6Y+6RARQAmm8sq2MZ166gvsaUV93S8jAv6otFWEupOCI1SXVudPtKJCogzf9ka2JhR5vwapnbXsBbpQcECCn4MHt7MWOPQazoSNYBoQzkdwm7yxBH2ghEy9+ZgZZ7h88iu1MiOi6Dwwg/oiGX8Z27rkyskiPMB6YULmG9ArfHR0jam2JWv9AVXSNM3UHvoGdCeIZXUnyMfE2iFv4egpu2ubHCC/bNj67h6gPRMFRqwPKe7NsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739049241; c=relaxed/relaxed;
	bh=Yuom+fAcg0LIKG8GCnhZmdPyedfX7kOZ+zWmzLSTTLE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=lyyi9cfeu+W05evUWVgRq6SXLN5YYR4WpyDl2Bm445+f3glQt/SBymh/TqVpUH7roDZXuJFBFHITzrEqfWui6a3U3lRiKoogZ/xoNpW4fIkNzmY7puc3hvvh3oUYx6Yg03F0NExL6gYhegWcMVDjlScfGbWHp0Tx2PeojoOfkaFNL4xKL7A7vVI4Hu3Gz++c1IUwG9HCU7xLhU5HjyFjmY40Pv7n9CnqVri8oDS/4kb2iGa+W7pKrHNHGII+x8wnB8+fKTVNbgvcUMlIb7Se2UW8gB8GpFmAXK0n6QXV0nyFPVO/lGJdq/v7pCDQNF6ha3jLpo/rH+CuQTtMWmT+Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CdemqM9c; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CdemqM9c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yr3Vb5Lwdz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 08:13:58 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaec111762bso773905166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 13:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739049233; x=1739654033; darn=lists.ozlabs.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yuom+fAcg0LIKG8GCnhZmdPyedfX7kOZ+zWmzLSTTLE=;
        b=CdemqM9cPL2LBME+InN56F2y1bA/Tii5IbFT9QHwpm8WABYqP4xScRtf6VX9QNkvMA
         pfLmMdFq//40Aq82Rano/oA+xsbJy4bDgM7E1vFWddaNaypH015++8TARu1Eyme7titx
         EPHzEpKtEhWgwLtrS09ZgLteUMdHp+5BuXeyt+slR+kWNJME4+4TX04yX5qMW1lTKJkX
         1ZwHeM4QCwpnAPk8+d4qs489ICFV2ZFxIZhSJOfaAzsX/pKO/pvV04sEWaEbiI8RDe5l
         0icNWHKwnr4uh8BNZOQ6VKLpEAeEGv7yFemmMXQTdbHiVJ/4OCDBe69ol9PojdYVTH19
         Dvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739049233; x=1739654033;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yuom+fAcg0LIKG8GCnhZmdPyedfX7kOZ+zWmzLSTTLE=;
        b=jBXQWfpWLcq3ph9JRzoCxsfhck8/5mGDJ5VhsfUlaw/UtpWw2a9xc/WK+KMf8DQf1f
         hGJ5acIofoRp9VO6voXZ0G5ZqxUkYKbCQ5UsqlS4FlCEJQpMkcDLMgQhw5mTYLjZO1GR
         DR60mBUb6cmV+Z2zZfkmGjtPtx6RhtiJmj7RYFLRT3eiWX8bnPVCZLWntxpHgDTdqWZn
         CmJnnS6uqzRm+jlCr264JUxI1uUCcaBj9qEk8zRIR/+fTu3T0Aucz0ubmsPqg3Yn7RST
         9FyWgR8mZWM7qC9KPhNFUpz3cP4+0QJNqRosWQtQsi/2gwt6j2uWWLWYwEDQ+VUrfmhI
         aVKw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSC3cQ8K0MDRAKvU7pG0C+maKjI6Lr9x7pnKb+nOrOSl+UF378cyDVjMNPvp5HJ5TSSUMJCjPE0hWH1g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwU8Uhs4HgMmN0YNQWfqfp4ICXZE3iTAAOTpSOXp1PN11fp7Val
	H9zNQDL7pr96fqVpEHyyM11P7G3S6JTJRZG/gOlaE+YLr1cBy70P
X-Gm-Gg: ASbGncvfHyIJfPersnYW6MbI9p8xPlGZ4b3qC2N2VOuN/aSkKZuwPqBd23vM4ZH53iD
	1WO8eWuly9ThjIFJ86aYClQkg5JtgY7SBFQgm5hZmLB5s+wNFM1y7pgUIgMNp0K3aEfYKJZ4wmv
	XgCa/lT/+fCCz5iWAFmH+M+EIYvr3TFEhDWuPX7ZlYWDSNAifLN2wsNa74oPRHzMHy8/aft3GMt
	sR2Rpzy5MVWbkWLb7dcvfC1wv6HoUlPUErSP/95c3PJqajtadJAcaZAXR4muG+27WCqRQmzR0jh
	xDZ/VOkcmFF2BQwKJ25mJIINOPoUGeTqgodnLd6HTAkFaW3Kl/FXXnYB/2L2ioVzOeCCH35CKgf
	CyLKLy5/MhAdiA9L2epnXLq1AZdnvLkFfin2spZ0uKfPjveve1BtfVrWKt2JcgeY01MuZCAZxyH
	M+lTg4pTE=
X-Google-Smtp-Source: AGHT+IE5Y1r/zvxcLRd3QRDzVSyau3pCl0h0Recf7MhHmEd0OxZWSNta0GkDv3jugdxHaaRvOW5ERg==
X-Received: by 2002:a17:907:9719:b0:a9e:b2da:b4a3 with SMTP id a640c23a62f3a-ab789c627ecmr956789466b.42.1739049233110;
        Sat, 08 Feb 2025 13:13:53 -0800 (PST)
Received: from ?IPV6:2a02:3100:b375:7f00:211e:90a3:e1ba:6cbb? (dynamic-2a02-3100-b375-7f00-211e-90a3-e1ba-6cbb.310.pool.telefonica.de. [2a02:3100:b375:7f00:211e:90a3:e1ba:6cbb])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab772f48882sm548067066b.19.2025.02.08.13.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 13:13:51 -0800 (PST)
Message-ID: <11be8192-b722-4680-9d1c-3e4323afc27f@gmail.com>
Date: Sat, 8 Feb 2025 22:14:15 +0100
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
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: phy: remove unused PHY_INIT_TIMEOUT definitions
To: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both identical definitions of PHY_INIT_TIMEOUT aren't used,
so remove them.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/ucc_geth.h | 1 -
 include/linux/phy.h                       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index 38789faae..03b515240 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -890,7 +890,6 @@ struct ucc_geth_hardware_statistics {
 							   addresses */
 
 #define TX_TIMEOUT                              (1*HZ)
-#define PHY_INIT_TIMEOUT                        100000
 #define PHY_CHANGE_TIME                         2
 
 /* Fast Ethernet (10/100 Mbps) */
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3028f8abf..9cb86666c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -293,7 +293,6 @@ static inline long rgmii_clock(int speed)
 	}
 }
 
-#define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
 
 #define PHY_MAX_ADDR	32
-- 
2.48.1




