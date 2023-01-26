Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6E67D098
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 16:48:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2lVB5pknz3fD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 02:48:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=techsingularity.net (client-ip=46.22.136.236; helo=outbound-smtp52.blacknight.com; envelope-from=mgorman@techsingularity.net; receiver=<UNKNOWN>)
Received: from outbound-smtp52.blacknight.com (outbound-smtp52.blacknight.com [46.22.136.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2lTf6CgLz3cgs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 02:47:50 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp52.blacknight.com (Postfix) with ESMTPS id A4D51FAC7E
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:47:44 +0000 (GMT)
Received: (qmail 28996 invoked from network); 26 Jan 2023 15:47:44 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.198.246])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 Jan 2023 15:47:44 -0000
Date: Thu, 26 Jan 2023 15:47:40 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 6/7] mm: introduce mod_vm_flags_nolock and use it in
 untrack_pfn
Message-ID: <20230126154740.j3a3lu4x557c56yi@techsingularity.net>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-7-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20230125233554.153109-7-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 03:35:53PM -0800, Suren Baghdasaryan wrote:
> In cases when VMA flags are modified after VMA was isolated and mmap_lock
> was downgraded, flags modifications would result in an assertion because
> mmap write lock is not held.

Add note that it's also used during exit when the locking of the VMAs
becomes irrelevant (mm users is 0, should be no VMA modifications taking
place other than zap).

The typical naming pattern when a caller either knows it holds the necessary
lock or knows it does not matter is __mod_vm_flags()

> Introduce mod_vm_flags_nolock to be used in such situation, when VMA is
> not part of VMA tree and locking it is not required.

Instead of such situations, describe in as "used when the caller takes
responsibility for the required locking".

> Pass a hint to untrack_pfn to conditionally use mod_vm_flags_nolock for
> flags modification and to avoid assertion.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Patch itself looks ok. It strays close to being "conditional locking"
though which might attract some complaints.

-- 
Mel Gorman
SUSE Labs
