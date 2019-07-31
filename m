Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F07C39D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 15:32:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zDrG28nFzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 23:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zBjQ5KyVzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 21:56:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45zBjQ0hd0z9sMQ; Wed, 31 Jul 2019 21:56:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45zBjP5xMjz9s00;
 Wed, 31 Jul 2019 21:56:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 107/107] perf vendor events power9: Added missing event
 descriptions
In-Reply-To: <20190730025610.22603-108-acme@kernel.org>
References: <20190730025610.22603-1-acme@kernel.org>
 <20190730025610.22603-108-acme@kernel.org>
Date: Wed, 31 Jul 2019 21:56:40 +1000
Message-ID: <87a7cuqux3.fsf@concordia.ellerman.id.au>
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Michael Petlan <mpetlan@redhat.com>,
 Paul Clarke <pc@us.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Carl Love <cel@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnaldo Carvalho de Melo <acme@kernel.org> writes:
> From: Michael Petlan <mpetlan@redhat.com>
>
> Documentation source:
>
> https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf
>
> Signed-off-by: Michael Petlan <mpetlan@redhat.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Cc: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>
> Cc: Carl Love <cel@us.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Cc: Paul Clarke <pc@us.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: linuxppc-dev@ozlabs.org
> LPU-Reference: 20190719100837.7503-1-mpetlan@redhat.com
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
