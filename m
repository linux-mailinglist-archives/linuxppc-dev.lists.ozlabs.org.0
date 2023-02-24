Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436B6A1C12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 13:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNTWk35yRz3f4L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 23:21:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20210112 header.b=hgXvCjii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=googlemail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=michalechner92@googlemail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20210112 header.b=hgXvCjii;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNPY60zYdz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 20:21:59 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so1335139wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enxa5NHwq2O6TtrXNEzJfnjaG+bP30p6bngVUy4j558=;
        b=hgXvCjiiqmvOyIz45/LTlHQkgvsKqQh4SPYtgY1n5GLpOzmjvc/Am+HB4gHxpWDy/K
         J1fbD9bqO/9jOJ9kww5wjj9ked1w1K7nK97Uv0o1vz804YyQDmvmdk2kuT4HgMh7u2dh
         SKq2E9+oXUUWfmIlWHtF0QPAURDlz7/oyiRLmNdYR4lVb7L/klcnYAhAs51pbE7AP35M
         wT2R0FgnaEQtb+3O3qfyy5o0VY/K8V5t0+CIQD8/xxwzHrSbdZDlKffBioyyxfytjc0L
         QvmqMTA3DZDAwY1ti/5dcBQt6gXqMIi6nk6b4aVSgPkCf3w6kYMwR6Tfq5f5jVwPd5ec
         QIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enxa5NHwq2O6TtrXNEzJfnjaG+bP30p6bngVUy4j558=;
        b=1TEkBBbQZQweG/TWcHhI2pMV7lq4LoND4Xqsjs2IOJIDUICmxXNT2lDM2DLvCaRrJC
         HDqsxFUs3gv29yvvAfc/ODDJaxtjxV77zCkCP6B+yylnceTCmor1aCvEgJRHNW+k9tEl
         PbV2jPjupvxlVP73J254gv66Iu9Od3DHSVwiaxAXdgWi0yLjLfi2jK2Uh/WRErALPgS9
         TaGp51l/SBe5fx3NIVMHB+FT3nLEYvReR8NN4mQi+tjs7lLMVLjjQ51h8KLm1EwsBDyo
         caImhesUZBdqY3EXSM4iNBnIVhrUIWk5MHyGl2eCDhhhXrVFTrzwstpB3PVYSaBwfK44
         Q9Pg==
X-Gm-Message-State: AO0yUKUj6T6axGJksgPExGeUpQ1RmIqJs5bGvzr+vnU3OJm/oZ1KO2c7
	YMK+A7ZxkQ4m4w==
X-Google-Smtp-Source: AK7set+m22cQJ0Vr+IFOQBtCF3t/xEvUUsdUgXvxgBwNIU08DejTG6SPFoBC7fhpPq+6LyZy7YAtww==
X-Received: by 2002:a05:600c:1652:b0:3e0:c75:7071 with SMTP id o18-20020a05600c165200b003e00c757071mr6588585wmn.5.1677230515541;
        Fri, 24 Feb 2023 01:21:55 -0800 (PST)
Received: from localhost.localdomain (ip2504e2d3.dynamic.kabel-deutschland.de. [37.4.226.211])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003ea57808179sm2128205wmh.38.2023.02.24.01.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:21:53 -0800 (PST)
From: freak07 <michalechner92@googlemail.com>
To: surenb@google.com
Subject: Re: [PATCH v3 00/35] Per-VMA locks
Date: Fri, 24 Feb 2023 10:21:34 +0100
Message-Id: <20230224092134.30603-1-michalechner92@googlemail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
References: <20230216051750.3125598-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Feb 2023 23:20:19 +1100
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
Cc: joelaf@google.com, michel@lespinasse.org, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, gurua@google.com, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, paulmck@kernel.org, x86@kernel.org, hughd@google.com, willy@infradead.org, peterz@infradead.org, mingo@redhat.com, vbabka@suse.cz, rientjes@google.com, gthelen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, axelrasmussen@google.com, ldufour@linux.ibm.com, linux-arm-kernel@lists.infradead.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, mgorman@techsingularity.net, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linu
 xppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Here are some measurements from a Pixel 7 Pro that´s running a kernel either with the Per-VMA locks patchset or without. 
If there´s interest I can provide results of other specific apps as well.

Results are from consecutive cold app launches issued with "am start" command spawning the main activity of Slack Android app. 

https://docs.google.com/spreadsheets/d/1ktujfcyDmIJoQMWsoizGIE-0A_jMS9VMw_seehUY9s0/edit?usp=sharing

There´s quite a noticeable improvement, as can be seen in the graph. The results were reproducible. 

If you have any questions feel free to ask. 
