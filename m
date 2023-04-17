Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E216E77DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 12:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1d755qCPz3fZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 20:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=77.87.242.242; helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN>)
X-Greylist: delayed 383 seconds by postgrey-1.36 at boromir; Tue, 18 Apr 2023 02:25:12 AEST
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0XTN66V2z3cTk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 02:25:11 +1000 (AEST)
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id C72A61802BA;
	Mon, 17 Apr 2023 18:18:41 +0200 (CEST)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: danielwa@cisco.com
Subject: Re: [PATCH 1/4] add generic builtin command line
Date: Mon, 17 Apr 2023 18:18:18 +0200
Message-Id: <20230417161818.2002082-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20190319232448.45964-2-danielwa@cisco.com>
References: <20190319232448.45964-2-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: christophe.leroy@c-s.fr, Tomas Mudrunka <tomas.mudrunka@gmail.com>, xe-linux-external@cisco.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, maksym.kokhan@globallogic.com, dwalker@fifo99.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This seems quite useful. Can you please merge it?
