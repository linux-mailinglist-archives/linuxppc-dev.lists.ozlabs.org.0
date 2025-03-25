Return-Path: <linuxppc-dev+bounces-7319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1EA6EA4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 08:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsg1SkHz2ypW;
	Tue, 25 Mar 2025 18:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742887207;
	cv=none; b=LGDwVNo5a6VwkcXbibAQEBK//MGVgrH1iicu/CwEC76pAt0P77PPZxwpBIWt37gQPbzQeiR6uLoE88S/5PzyyaGSZ942A5cerRU3eLm/6T/7qnMDhEXKB748WyPRjqw0pmvcGGWQP+3xl+2f8LvIG8HT++PyAfCdKqv3bcfAAPH+HIhxzF/Guz6T/DZgy6sRGlW/yQTxe2UplosrhPTxZD9Nyi7n0Y3Z0H5UMTBpmifaCiUFcuzztfnkUW8Dd06aFPgVwvX/0vGabVaEV20iV5/eei+SBpYU6A2SZW14A+Na531o6pVzbd1Y0I1QaiU3YvqJUx/jpp0uYGAEsXM2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742887207; c=relaxed/relaxed;
	bh=kDShMSxvkg820fpQJpj96lVsB5yI42I46t2/co9NjGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXBT6BiJtps2CpzXA7zDLhrQ05zzWpGza6hRBrSbtWuHHxZemqaFBUVyHe/iFZi1SaBr61uKBkdmUflCKf/AgOt4ISk7FlNPARZo7+jo5Ex+qkkpiwnz+k0uXWi0b0ngzy5N6bfF60N/dNayJ94ZVwzKbSKH5xacXjSDm35HloktpxA+m7H3xwypztqyAFKJwB72Yx1cFWxZw0b2ce+VzUr0YPPlmUre/J9pfiGYAO7WmsL1PWWLBko++Qc9EtBkrc99iFHCJmk202g8tePqp4vfHluvgEhRx+K5dD2jdd5178kHfD0p6ay8+clvS2DaQTZqhqRgDvSBwaNxbfHtDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsf278rz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 18:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZMLW63xsFz9sSN;
	Tue, 25 Mar 2025 08:04:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6JKQQL_eFrh; Tue, 25 Mar 2025 08:04:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZMLW635Zrz9sRy;
	Tue, 25 Mar 2025 08:04:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 519418B765;
	Tue, 25 Mar 2025 08:04:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RHurKaChOlYD; Tue, 25 Mar 2025 08:04:02 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B9F58B763;
	Tue, 25 Mar 2025 08:04:02 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 52P73rZi009331
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:03:53 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 52P73odJ009328;
	Tue, 25 Mar 2025 08:03:50 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stuart Yoder <stuyoder@gmail.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/3] MAINTAINERS: updates for the fsl-mc bus entry
Date: Tue, 25 Mar 2025 08:03:27 +0100
Message-ID: <174288553817.2234438.3505434675141018123.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
References: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742886214; l=861; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5ct58WUMCAhireJk5huWUvhQ9El2yA0OK7tPTYy9x7A=; b=F2JnbXHN3cz8KA26VpWyklKsskrhu/PjUTjpnQuGBhLOOzsPIA29F8wTqO9SMTufc2xs4Rk+V lBtj8F+abOTD2p1xRKgGg9i/g2W7MVVQaUYXg5qnJFtHn0aZl+bupc3
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 20 Mar 2025 14:03:16 +0200, Ioana Ciornei wrote:
> This patch set updates the fsl-mc bus driver MAINTAINERS entry. Since
> there are small separate changes, I put each of them into a separate
> patch.
> 
> Changes in v2:
> - 1/3: also removed Stuart from the MAINTAINERS file
> https://lore.kernel.org/linuxppc-dev/CAEac7tYQE76z4pYminhvMJR6GZ66RPRv4PxM-U9VpGJjvn6APg@mail.gmail.com/
> 
> [...]

Applied, thanks!

[1/3] MAINTAINERS: add myself as maintainer for the fsl-mc bus
      commit: 29904d6c1be66882c7148a1439e0f671fc02e56c
[2/3] MAINTAINERS: fix nonexistent dtbinding file name
      commit: baa9934908ad1cb6f7093c8ba15d518a43419f9a
[3/3] MAINTAINERS: add the linuppc-dev list to the fsl-mc bus entry
      commit: 586739b1e8b14a38145a80e7684874d1a3268498

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

