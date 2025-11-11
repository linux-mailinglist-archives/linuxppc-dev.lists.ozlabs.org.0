Return-Path: <linuxppc-dev+bounces-14101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C25C4DA28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 13:20:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Qbm6W03z2yvd;
	Tue, 11 Nov 2025 23:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762863636;
	cv=none; b=ThcXvwXYQ5CUg9PpLkcZvN7DUUHdBS8xvOBvWsFewa9Cev6wAMHlyjIMvI9LIij13Py+xsyyo4orZ1bUJzHXCBgvAFRxmhdo0u2MKJpPJ6kceSxPaQK1OE23TQUcPIrrSAF4T1cXzuxIwk6gT64mviQEe+y3lwnCM2tGmDlQPWBmVIM1T6raFTXHXj9B8jxbfppwsRGaMe2UBF/jY5toQei9DlNNg5dVR8u3i85D3Me2nfSbLObaI66vVxMdeqv9mFknmfMxN4D7HAfc4jjOcWYHwVwg73gCe1IKMJPXnLs3hTVct+lQ/Y2X6GguwmhoVfdbOM2io3WyHtLXFUS/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762863636; c=relaxed/relaxed;
	bh=bKfFa6N+DHU+OnnTGDZzw6++yllhZNek9vbTirlNvok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzaIbqovO1GRAiAwNUoT2jf4bNpUoFMWgsAe9wvd/SIKBcTKzqZF34k8Wc+R9WRpsaDMM9/ZewrWa01NTPVsaTVjDVP7vN7+htKrmu4c2Wrg2UZLguZdjmkcu9zokZ6/q7eqU94hRTBy7REptK4xNB9LoAlxP8mXfWe0Dw7wXiXCREjTXdAkyJ7IbCjgRABr0xmVU4gLweMJKiWKnE8nemBVQH4gC/tM+MjeCLsEQyx2upYABNIQhJ+2sEx6QhOryiuIBf9qUuVmziloDs1KyW91DbTp1qhTfqWM6J61fdCFmQw6giDVsykSCltCrdRs7wrxPliggC1p73bcITSUPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Qbm1wZ8z2xFR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 23:20:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d5PyG409Hz9sRy;
	Tue, 11 Nov 2025 12:51:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vf6vUqyXpgl; Tue, 11 Nov 2025 12:51:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d5PyG32vjz9sRh;
	Tue, 11 Nov 2025 12:51:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 557318B764;
	Tue, 11 Nov 2025 12:51:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dvZM4UXbgX0y; Tue, 11 Nov 2025 12:51:34 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E5368B763;
	Tue, 11 Nov 2025 12:51:34 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 5ABBpPQp477406
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 12:51:25 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 5ABBpOrG477404;
	Tue, 11 Nov 2025 12:51:24 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Marco Crivellari <marco.crivellari@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
Date: Tue, 11 Nov 2025 12:50:37 +0100
Message-ID: <176286176938.477075.17121782345964029950.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107152950.293899-1-marco.crivellari@suse.com>
References: <20251107152950.293899-1-marco.crivellari@suse.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=692; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=GMT1UkVoLHWjDk9aJk0jE8Gn1Xu0+OncH316VCEY/xA=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQKKwv8/D7BT+1Sd2dER8tf1zb1YHmTCh9Ni6fKcRPWJ 7Wv+xPbUcrCIMbFICumyHL8P/euGV1fUvOn7tKHmcPKBDKEgYtTACYibMrI8Co102RBaNTkCar8 hjEHzFJ/i76tnWqRsFXB/r167vbXIgz/Y423r234fVxr8vMV+1T/7W761GWxZfLbLcI+evo3Yrf X8AAA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 07 Nov 2025 16:29:50 +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
      commit: bdedc7414642e9c3793933d43b72c67f3b7db326

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

