Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A97DB407
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 08:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJl6c50jQz3bwj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 18:20:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJl6536sbz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 18:20:11 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qxMYU-003I9D-Ug; Mon, 30 Oct 2023 08:19:22 +0100
Received: from p5dc55299.dip0.t-ipconnect.de ([93.197.82.153] helo=z6.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qxMYU-003Lqt-Lh; Mon, 30 Oct 2023 08:19:22 +0100
Received: from glaubitz by z6.fritz.box with local (Exim 4.96)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1qxMYU-000ydU-0h;
	Mon, 30 Oct 2023 08:19:22 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: arnd@kernel.org
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
Date: Mon, 30 Oct 2023 08:19:22 +0100
Message-Id: <20231030071922.233080-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023131953.2876682-1-arnd@kernel.org>
References: <20231023131953.2876682-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.82.153
X-ZEDAT-Hint: PO
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
Cc: stf_xl@wp.pl, alexandre.belloni@bootlin.com, quic_jjohnson@quicinc.com, arnd@arndb.de, geoff@infradead.org, gregkh@linuxfoundation.org, kvalo@kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, claudiu.beznea@tuxon.dev, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, geert@linux-m68k.org, pavel@ucw.cz, kuba@kernel.org, gregory.greenman@intel.com, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd!

There is some non-x86 hardware like the Amiga that still uses PCMCIA-style networking
cards on machines like the A600 and A1200. So, unless these drivers are actually causing
problems, I would rather not see them go yet.

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
