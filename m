Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5F2A603D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 10:09:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR16b4x2SzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:08:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K1+Rdz5o; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR13p0TKLzDqY6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:06:28 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id g12so21152583wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZVySsFYAxVyvKjZwFTKaFMnVATseHBsi4tJ0dIp9TLE=;
 b=K1+Rdz5ogf/5T2jMdF3v9m88jLY/gNqsMKJm061QdgaEQGjK4st39GT4kTZK6c7eAv
 3cJicgPoZBh9YEvxLFGZcZyHE0XnNqBy1XOiWQuoMPDL9faO4RhxQ9VP++HCtvthQR9S
 799P3oQD3ZEWTAn8Z+1PDWW2WOSIRjZ/YNizWauRHAov45YgSsQGFvDCGkpGdXI1KiOg
 QyMiZ+qAf84rNKlDHGrCMb3Z298LfBhK4STT2/MKrClXtDUj1+DxmNn50j9f2xT6h0lS
 2FLRla4Vx5B06Pb85+k62n0XQr8agXXsfRziu37OjAXEKgzSYzjV1kzmZ4S3HLfgeg3X
 jRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZVySsFYAxVyvKjZwFTKaFMnVATseHBsi4tJ0dIp9TLE=;
 b=eh7v+h6NUhpzTb5rkhxn0iPqLL1RCEFbrKXyjqTTBE0bExExZRaHRp+5H+fqzcUe4n
 JHNfFD1/q4C2SsZhNHy0fBGgxC5O4F0mA5+ydTs9mNYXvxlCyHlLYhYAYPCszw1LPVuU
 FuwRzsBTQthd1vC4CzFTDInmfqLX1s86j9TSeegRwdol1Wut1wWFX/wG/qNSwxXVvIH/
 YW9NEveaxreBv2FzGCOTMH5TPMGkFeD4HlIB5bYPVXI4u7CbS4qCeNp03z8Y9bdK0l5M
 1KrQBkfjtJGEznsQB5os5t1D6nDPSP4VmG17jTz7+OX/kFhpFBwNsg9EZ0L87ZsQR8LG
 Rtlg==
X-Gm-Message-State: AOAM531Elw0yRUBCOPIKJcxbs/FQsi63dt2fgDpzlbi/NKKNi8vD7XyV
 O0EL+sPJpOZL8rThPVADz/j3KQ==
X-Google-Smtp-Source: ABdhPJzn8d8Abh2QVS+FdXToKUqdpB6TwiMSAYlD5+ls0hMcq+h/pWmcBsJhdaEKInesWzdpNiQxsw==
X-Received: by 2002:adf:e384:: with SMTP id e4mr31089426wrm.227.1604480782887; 
 Wed, 04 Nov 2020 01:06:22 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:06:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 00/12] [Set 2] Rid W=1 warnings in Net
Date: Wed,  4 Nov 2020 09:05:58 +0000
Message-Id: <20201104090610.1446616-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Song Liu <songliubraving@fb.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Martin Habets <mhabets@solarflare.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Cammaert <pc@denkart.be>,
 Paul Mackerras <paulus@samba.org>, Dustin McIntire <dustin@sensoria.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, Lee Jones <lee.jones@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Paul Durrant <paul@xen.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 John Williams <john.williams@xilinx.com>, xen-devel@lists.xenproject.org,
 Woojung Huh <woojung.huh@microchip.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Daris A Nevil <dnevil@snmc.com>,
 Lijun Pan <ljp@linux.ibm.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@chromium.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Santiago Leon <santi_leon@yahoo.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Erik Stahlman <erik@vt.edu>, John Allen <jallen@linux.vnet.ibm.com>,
 Utz Bacher <utz.bacher@de.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 bpf@vger.kernel.org, Shannon Nelson <snelson@pensando.io>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
 Russell King <rmk@arm.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is the last set.

Lee Jones (12):
  net: usb: lan78xx: Remove lots of set but unused 'ret' variables
  net: ethernet: smsc: smc911x: Mark 'status' as __maybe_unused
  net: ethernet: xilinx: xilinx_emaclite: Document 'txqueue' even if it
    is unused
  net: ethernet: smsc: smc91x: Demote non-conformant kernel function
    header
  net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
  net: ethernet: ti: am65-cpsw-qos: Demote non-conformant function
    header
  net: ethernet: ti: am65-cpts: Document am65_cpts_rx_enable()'s 'en'
    parameter
  net: xen-netfront: Demote non-kernel-doc headers to standard comment
    blocks
  net: ethernet: ibm: ibmvnic: Fix some kernel-doc misdemeanours
  net: ethernet: toshiba: ps3_gelic_net: Fix some kernel-doc
    misdemeanours
  net: ethernet: toshiba: spider_net: Document a whole bunch of function
    parameters
  net: ethernet: ibm: ibmvnic: Fix some kernel-doc issues

 drivers/net/ethernet/ibm/ibmvnic.c            |  27 ++-
 drivers/net/ethernet/smsc/smc911x.c           |   6 +-
 drivers/net/ethernet/smsc/smc91x.c            |   2 +-
 drivers/net/ethernet/ti/am65-cpsw-qos.c       |   2 +-
 drivers/net/ethernet/ti/am65-cpts.c           |   2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c  |   9 +-
 drivers/net/ethernet/toshiba/spider_net.c     |  18 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c |   1 +
 drivers/net/usb/lan78xx.c                     | 212 +++++++++---------
 drivers/net/xen-netback/xenbus.c              |   4 +-
 drivers/net/xen-netfront.c                    |   6 +-
 11 files changed, 141 insertions(+), 148 deletions(-)

Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Dany Madden <drt@linux.ibm.com>
Cc: Daris A Nevil <dnevil@snmc.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Dustin McIntire <dustin@sensoria.com>
Cc: Erik Stahlman <erik@vt.edu>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ishizaki Kou <kou.ishizaki@toshiba.co.jp>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jens Osterkamp <Jens.Osterkamp@de.ibm.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Allen <jallen@linux.vnet.ibm.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: John Williams <john.williams@xilinx.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: KP Singh <kpsingh@chromium.org>
Cc: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org
Cc: Martin Habets <mhabets@solarflare.com>
Cc: Martin KaFai Lau <kafai@fb.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Cc: netdev@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Paul Durrant <paul@xen.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Cammaert <pc@denkart.be>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: Rusty Russell <rusty@rustcorp.com.au>
Cc: Santiago Leon <santi_leon@yahoo.com>
Cc: Shannon Nelson <snelson@pensando.io>
Cc: Song Liu <songliubraving@fb.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Cc: Utz Bacher <utz.bacher@de.ibm.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Woojung Huh <woojung.huh@microchip.com>
Cc: xen-devel@lists.xenproject.org
Cc: Yonghong Song <yhs@fb.com>
-- 
2.25.1

