Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0534D4EA162
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:22:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS3yf720sz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 07:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bu6t4srH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y4auQ0hn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Bu6t4srH; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y4auQ0hn; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS3xv560nz3c00
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 07:21:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648498896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3p40tNFk+gHnhhZuqFavI/fEyZfK9XcFxgpC8+00PDQ=;
 b=Bu6t4srHvL2H+FyB75mdAxFj+takss5+KuvhLKNDdmTkCMjw3VhzfzBpHUNnCZAHkPgHDN
 BKJES4F59xkFyUCx3gXOIL8bEZSr6/gY0l1oNuNoPKDyXOqhYPgA4JPIhbACD7PakCtPXO
 5HINpOO4+/z2JTQcKTtAUqy9HzJF2Eg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648498897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3p40tNFk+gHnhhZuqFavI/fEyZfK9XcFxgpC8+00PDQ=;
 b=Y4auQ0hn1yFrGRjlqtgBhF8t4ymheWBy8wt0cEUNIdPtF76Lb+m9rIzW/uqKyfiWsPWm8L
 sPAXxT06tMJQFMZUA/qws8p+W6Gw+USjg2iJ2I4N7YaeZUl3NeZtRfoiC+qd1HgXUbam6h
 WOdsOwLteN6uj42F63dDGzbWUlxE3n0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-j3o8dLU2P-CZxSjsXhLAwQ-1; Mon, 28 Mar 2022 16:21:35 -0400
X-MC-Unique: j3o8dLU2P-CZxSjsXhLAwQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 o1-20020a0c9001000000b00440e415a3a2so12173309qvo.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 13:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3p40tNFk+gHnhhZuqFavI/fEyZfK9XcFxgpC8+00PDQ=;
 b=Fpbm6HLJGNFfjI5gBUFwZr+Wf1LK++GbKVIiCUJvq/dJ4tqUCEIia3lzfezHgV5Qsv
 rbWM4U6wMTMnYOY0GeErBbajvIEfWTtCDIEY4lR3bCFDyUPtinw/RBhrDz5yGDpGVUhS
 WWQF9IsuGrSxu6Q/++AABeiIqbDG02pbmBTvM9J6Fz1TOkvoLRJBDAAf+/YYEx2qHZlO
 LiuFtpadhr4r43MdjVszDWL0p7XMzv8+xdFuhP12Cz2tLo8CfqfqXSHMsXR4VlFicFuD
 5mY1dlBi07qtH4ivhg2l6m1Rrc73Otrxk4/cfLDXDq5a5abWWOaU68xbnT34p61O3TFS
 Ymvg==
X-Gm-Message-State: AOAM5323ghdv34Oe16MaRdr6E/4R52xHLDOYjdSAihu6yU+rbi/MCTuU
 LzQRYXLrfgt8TY8iwPHvSqCIv/5HTi310LfNwzIlfQrEY5r9+Vl+1H7nzF/VGZgpJKYRwS+iYtv
 29jddSLC0hIwCW94eEW6bUsXv4A==
X-Received: by 2002:a05:6214:29c7:b0:441:3f11:9315 with SMTP id
 gh7-20020a05621429c700b004413f119315mr22667906qvb.87.1648498895156; 
 Mon, 28 Mar 2022 13:21:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNM++ZxHApL6PNdttJ/yUMPNMmzlV+WiT8X4Xf2ogElGi09uECpKMGDIcr2ELe1JrOd+5kdg==
X-Received: by 2002:a05:6214:29c7:b0:441:3f11:9315 with SMTP id
 gh7-20020a05621429c700b004413f119315mr22667879qvb.87.1648498894940; 
 Mon, 28 Mar 2022 13:21:34 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::35])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm8275335qkk.52.2022.03.28.13.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 13:21:34 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:21:31 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Message-ID: <20220328202131.jis7swqswm7chn6k@treble>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
 <YkIXLnAxtPuSDcOW@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <YkIXLnAxtPuSDcOW@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Mark Rutland <mark.rutland@arm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 10:14:38PM +0200, Peter Zijlstra wrote:
> > FWIW, there have been some objtool patches for arm64 stack validation,
> > but the arm64 maintainers have been hesitant to get on board with
> > objtool, as it brings a certain maintenance burden.  Especially for the
> > full stack validation and ORC unwinder.  But if you only want inline
> > static calls and/or mcount then it'd probably be much easier to
> > maintain.
> 
> IIRC the major stumbling block for arm64 is the whole jump-table thing.
> Either they need to rely on compiler plugins to provide objtool that
> data (yuck, since we support at least 2 different compilers), disable
> jump-tables (yuck, for that limits code-gen just to please a tool) or
> use DWARF (yuck, because build times).

Well yeah, that was indeed the main technical issue but I seem to
remember some arm64 maintainers not really being sold on the value of
objtool regardless.

> There was a little talk about an impromptu 'abi' to communicate
> jump-table details to objtool without going full on DWARF, but that
> seems to have hit a dead end again.

Probably my fault, not enough hours in the day...

-- 
Josh

