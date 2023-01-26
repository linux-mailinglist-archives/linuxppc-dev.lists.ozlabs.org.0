Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224E67CF58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 16:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2kg41v9Tz3fHJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 02:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=techsingularity.net (client-ip=81.17.249.193; helo=outbound-smtp25.blacknight.com; envelope-from=mgorman@techsingularity.net; receiver=<UNKNOWN>)
Received: from outbound-smtp25.blacknight.com (outbound-smtp25.blacknight.com [81.17.249.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2kfT63Cxz3cgx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 02:10:23 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp25.blacknight.com (Postfix) with ESMTPS id 7982042036
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:10:19 +0000 (GMT)
Received: (qmail 15379 invoked from network); 26 Jan 2023 15:10:19 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.198.246])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 Jan 2023 15:10:18 -0000
Date: Thu, 26 Jan 2023 15:10:15 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
Message-ID: <20230126151015.ru2m26jkhwib6x6u@techsingularity.net>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-5-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20230125233554.153109-5-surenb@google.com>
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

On Wed, Jan 25, 2023 at 03:35:51PM -0800, Suren Baghdasaryan wrote:
> Replace direct modifications to vma->vm_flags with calls to modifier
> functions to be able to track flag changes and to keep vma locking
> correctness.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Mel Gorman <mgorman@techsingularity.net>

Minor comments that are safe to ignore.

I think a better name for mod_vm_flags is set_clear_vm_flags to hint that
the first flags are to be set and the second flags are to be cleared.
For this patch, it doesn't matter, but it might avoid accidental swapping
in the future.

reset_vm_flags might also be better named as reinit_vma_flags (or
vma_flags_reinit). Maybe also encourage the use of [set|clear_mod]_vm_flags
where possible in the comment to track exactly what is changing and
why. Some cases like userfaultfd just want to clear __VM_UFFD_FLAGS but
altering the flow in this patch is inappropriate and error prone. Others
such as the infiniband changes and madvise are a lot more complex.

-- 
Mel Gorman
SUSE Labs
