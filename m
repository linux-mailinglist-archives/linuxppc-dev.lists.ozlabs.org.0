Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C043660EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 22:52:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45l7Xc4FVSzDqhl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 06:52:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="OH1nH1Jx"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45l7Vp3NvwzDqcc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 06:50:42 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id v18so7160444ljh.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dYjxp66wgB3t394QorK0WPrW2jXGX2qG/znE9bxRn1o=;
 b=OH1nH1JxcyIJ1Frv7bR1psVD2AkOX68Z06jMu6w+iKf4koMKEnVt0JThRnXKzImvV7
 J3Z3Nl/H5FA/erTmCGF/qw3sMCLW0JXQR/CgOLxF+xN3iTuTAPf+3vmVJxb5wDaonHmn
 N5opQfDUhQroiwNBX3un98PdvECR62kpygl3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dYjxp66wgB3t394QorK0WPrW2jXGX2qG/znE9bxRn1o=;
 b=XRGbwKYGtooPt/gBtYFznLrz+/ujQTLzegD37XiFLK6/o8my6J+7tXJscKqYkBCLc5
 OWPoBVg6g73MJ8VzwnZnH+4CQXXw2P5IlYl5TwYS3zZWNuH93scLz0V7+xWDVauMafGN
 IvHOqc7Ktx5P6Rw8Vw3C2MxSxmVVs4xPVQUYWIVwStuA/ZEdUJNOGUz8QBaJR5B2ypqH
 mUx6xjpm+DOeW3ebXooGh1116y7B4u0NHgKgsjnDoTAQv87hyUABdFl8yK+8wSCFTxyy
 LIU97NnLoAqNIbuXBD8txjKDZqzZ56BQ6yvCOlaBnrzB3HrOzitWqwoHxQYu7ACyvDyQ
 ODAQ==
X-Gm-Message-State: APjAAAVlM6tg6OhvffQ1Smfecn89ABRFB+TAOZuzgGkmHbLm9sE4CDAw
 sEOUwPWJdO3CaQOaR2wUIqSt/IwN2Up3fOjdkAM=
X-Google-Smtp-Source: APXvYqyTowl8LDpO3glgWe4q53UddCDACSqIkn83mbNwYk66wIQHKoZZ8RculjXa8Wt7mSwwCQxgYNfcJFE9RnOFrVI=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr3641900ljg.19.1562878238030;
 Thu, 11 Jul 2019 13:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190711204541.28940-1-joel@joelfernandes.org>
In-Reply-To: <20190711204541.28940-1-joel@joelfernandes.org>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 11 Jul 2019 16:50:26 -0400
Message-ID: <CAEXW_YS=Sb6k4_Z-fXdtERTHZDO_PHQCOhx6bhotWduCB7K28w@mail.gmail.com>
Subject: Re: [PATCH] treewide: Rename rcu_dereference_raw_notrace to _check
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: rcu <rcu@vger.kernel.org>, kernel-team <kernel-team@android.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kvm-ppc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>, Byungchul Park <byungchul.park@lge.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 11, 2019 at 4:45 PM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> The rcu_dereference_raw_notrace() API name is confusing.
> It is equivalent to rcu_dereference_raw() except that it also does
> sparse pointer checking.
>
> There are only a few users of rcu_dereference_raw_notrace(). This
> patches renames all of them to be rcu_dereference_raw_check with the
> "check" indicating sparse checking.
>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

There also these _notrace things but I am Ok with leaving them alone for now:
hash_for_each_possible_rcu_notrace
hlist_for_each_entry_rcu_notrace

- Joel
