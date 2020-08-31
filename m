Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39050257188
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 03:27:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bfsy144szzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 11:27:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AMICkpYp; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfswC5j0JzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 11:25:47 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o16so901799pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 18:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eARx1NqbK9cEMSTK0kovkIRCeTmjYLrGl8JwZL49msc=;
 b=AMICkpYpQtfwYuM5YfzmKI/2S9Dy7iamVYX274pCkmLkM020DzLO/KECFWB0LrrYRA
 EHvm2gwJNKHGFSM3G1i5kLcG6PSFldnFM3tHw5B6GDChDXhjmI99A6t7UQnerBn0+njY
 yCjTCAyPvSArL44z50DFQxOXq/8d3d7yUHKkoylWkVDmYRRT/wYyRWxwP9Dd9LfFukU2
 ET9jTGnrgi+N09mEZVeUECtMglYsdQDVn5Gv7BcQg8KEZEWtCJEdqbhvjQO+kIqOk4Fc
 qG0ef/Oqzc6xSoMqmyj82eKigo0G/7wiERd2/zdTZYPqPa5FrEUN42l/MvQxC32emVyf
 jj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eARx1NqbK9cEMSTK0kovkIRCeTmjYLrGl8JwZL49msc=;
 b=HRIl16oUyKrUEDe7KmDdRemEM8e7hdAHdYWqB7Uzyx+P0kiRNObdGpisMDu/A6zw9Z
 Ibs7VM+RodC9i9kThV6peW/qrAWdXRjMtZp32XXWbcNMVyHXa9rw2bD3dK5Qc3xm9bal
 iODSZzDMvUOC0wV9lQ4pWq0+8koyiGP00oiAVoShHlpNxeOuOab9nBKRslnzSYAD7OF1
 RwQyV3Pr+Zv4MZA+HsmwQ6G71PDFQHgg5WF/4eJ6knSXLu8G4DDnpF46HGekWXL5GMWi
 e/lOXwrxHg5MDCMRZfvlitFlIpDaxAmgYW3N1LlSQM5wtZB6Vw6aa3XvoEqdRY3sQzuc
 bGvg==
X-Gm-Message-State: AOAM531U4F+sqG+ejei7G3GwDUljt3rdMjlqqi+PZewf9rYYA2lM8eGh
 QtGZwOqTIF4gHWNgJfK/6sERebZuQWU=
X-Google-Smtp-Source: ABdhPJx/37k6JWKk7f4bhAcf3BKShVBZljvH6AJ/SamaTx0TBqUROompCQBrZqrwy1BdpiHRWFV0kQ==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr8718820pjb.126.1598837145608; 
 Sun, 30 Aug 2020 18:25:45 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id d1sm5201193pjs.17.2020.08.30.18.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 18:25:45 -0700 (PDT)
Date: Mon, 31 Aug 2020 11:25:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] mm: fix exec activate_mm vs TLB shootdown and lazy
 tlb switching race
To: peterz@infradead.org
References: <20200828100022.1099682-1-npiggin@gmail.com>
 <20200828100022.1099682-2-npiggin@gmail.com>
 <20200828111525.GX1362448@hirez.programming.kicks-ass.net>
In-Reply-To: <20200828111525.GX1362448@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1598836589.75k5wmftvn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from peterz@infradead.org's message of August 28, 2020 9:15 pm:
> On Fri, Aug 28, 2020 at 08:00:19PM +1000, Nicholas Piggin wrote:
>=20
>> Closing this race only requires interrupts to be disabled while ->mm
>> and ->active_mm are being switched, but the TLB problem requires also
>> holding interrupts off over activate_mm. Unfortunately not all archs
>> can do that yet, e.g., arm defers the switch if irqs are disabled and
>> expects finish_arch_post_lock_switch() to be called to complete the
>> flush; um takes a blocking lock in activate_mm().
>=20
> ARM at least has activate_mm() :=3D switch_mm(), so it could be made to
> work.
>

Yeah, so long as that post_lock_switch switch did the right thing with
respect to its TLB flushing. It should do because arm doesn't seem to
check ->mm or ->active_mm (and if it was broken, the scheduler context
switch would be suspect too). I don't think the fix would be hard, just
that I don't have a good way to test it and qemu isn't great for testing
this kind of thing.

um too I think could probably defer that lock until after interrupts are
enabled again. I might throw a bunch of arch conversion patches over the
wall if this gets merged and try to move things along.

Thanks,
Nick
