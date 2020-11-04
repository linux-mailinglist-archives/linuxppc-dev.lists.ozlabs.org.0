Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE072A5F06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 08:59:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQzZN3QmXzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 18:59:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=depni.sinp.msu.ru (client-ip=213.131.7.21;
 helo=depni-mx.sinp.msu.ru; envelope-from=belyshev@depni.sinp.msu.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=depni.sinp.msu.ru
Received: from depni-mx.sinp.msu.ru (depni-mx.sinp.msu.ru [213.131.7.21])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CQzXn5nxvzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 18:57:59 +1100 (AEDT)
Received: from spider (unknown [176.192.246.239])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id CA4711BF43D;
 Wed,  4 Nov 2020 10:57:58 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Setup the early hash table at all time.
References: <b8f8101c368b8a6451844a58d7bd7d83c14cf2aa.1601566529.git.christophe.leroy@csgroup.eu>
 <87wnz8vizm.fsf@igel.home> <87y2jouw8k.fsf@mpe.ellerman.id.au>
 <87v9esaxlv.fsf@igel.home>
 <20201030140047.Horde.TJJqKGzG9vSGbMRNIj-MPg7@messagerie.c-s.fr>
 <87pn4zc0zl.fsf@igel.home>
 <1f8494cd-36db-e3a2-8ea4-28fb976468e7@csgroup.eu>
 <875z6mmfna.fsf@depni.sinp.msu.ru>
 <5acd7caf-99e9-9cb5-ed24-578d2e0a5ee1@csgroup.eu>
Date: Wed, 04 Nov 2020 10:57:53 +0300
In-Reply-To: <5acd7caf-99e9-9cb5-ed24-578d2e0a5ee1@csgroup.eu> (Christophe
 Leroy's message of "Wed, 4 Nov 2020 07:44:32 +0100")
Message-ID: <871rh9mu4e.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>, Andreas Schwab <schwab@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> To be sure we are not in front of a long lasting bug, could you try
> CONFIG_KASAN=y on v5.9 ?

Indeed it started to fail somewhere between v5.6 and v5.7.

v5.7 fails early with few messages on the console with reboot, v5.8 and
later hang right at bootloader.

I'm bisecting now.
