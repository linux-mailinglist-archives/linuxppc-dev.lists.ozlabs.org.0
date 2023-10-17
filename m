Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AAD7CCCB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:57:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OpzXlhaH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S94Wf0sQ9z3vXb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:57:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OpzXlhaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S94Tl375Rz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:55:38 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6b709048d8eso2976172b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697572534; x=1698177334; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJulstcUd5/uTxrCXWl5kYXpRYu+VuExy2t32bX2aJ4=;
        b=OpzXlhaHOq6/IMdwvJ1GVlgWzzrFM/UuUKapQ/kSldyPuJrHZduTHXenjTrWPTkt1E
         7dkBJgisCwPbPS27ToiXn9p5Nf1W8VgDgbUhAJ7q8er6aOsO/be9eJTW85Sz0KX8zCh7
         AlvDFYXhNZ5U9SfAP/7iHDJpycnPAeJrgGgofOofDWBRlFwsKASmUPN+coKkdFXtdbOM
         7OWENDR35TUE1ArlTYxbWAbUhBgtgv+VXqR/kQCV9b/rucHFGeSv70M9YLH17TFl1sy0
         7jkbfS7zM8CGaXgyxedHJMT5V/cAj6hr0FYdfA8CwaIYDFo5GcObqnMepyKg7yu9EVRr
         tPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697572534; x=1698177334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJulstcUd5/uTxrCXWl5kYXpRYu+VuExy2t32bX2aJ4=;
        b=XGzK9ZkzprsX2UX1Z8mJszTbfVinl1tR6RPwdhtkARYkpzv6YzmOm2mF0b8Lw/UbuK
         bCUjG2cpjLxpF042fVggGH/NMOh1fVNNKN9GLjxufdm34T/cX5cjqcOIKBVs9JGhzfH/
         dX7k6H8ONK/BqYZ0OlklWIEw95wNbGlfq1x0TLBzaLGKEDgfc7/4cPlGGXYqzq0Fceon
         cikN7XMe55RrT2g7bQ0y2QN7hcGydwxIefougT0fZRmhDWqlxV9pQw12qdLcTzlYqye/
         Umct9YyHp43bGMYJArWEUtgci3uTE5PB5TA+onV/UC6pHzzCOLIGmhmPQcfLTgriR8rw
         d8Yw==
X-Gm-Message-State: AOJu0YxDOMAU9nesYrmRnTJhgVi25UGkoB98Nfb6ytz5gJydK8X0/xxt
	vOgCqovGVAsgg+Ar02JMAyE=
X-Google-Smtp-Source: AGHT+IFVPtvMGRNNqkk6KcRmPHqM39EREZ1KiSDdRWgdSxuPd4g4MGW/CAIiKgMyPjMp9o9/z70fwQ==
X-Received: by 2002:a05:6a00:134f:b0:691:2d4:238e with SMTP id k15-20020a056a00134f00b0069102d4238emr3530984pfu.6.1697572534136;
        Tue, 17 Oct 2023 12:55:34 -0700 (PDT)
Received: from moohyul.svl.corp.google.com ([2620:15c:2a3:200:c77b:3fef:28e3:81d2])
        by smtp.gmail.com with ESMTPSA id a6-20020aa79706000000b0068fece2c190sm1848041pfg.70.2023.10.17.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:55:33 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	adrian.hunter@intel.com,
	irogers@google.com,
	jolsa@kernel.org,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/arch/powerpc: Fix the CPU ID const char* value by adding 0x prefix
Date: Tue, 17 Oct 2023 12:55:26 -0700
Message-ID: <169757198795.167943.3033399687445090221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231009050052.64935-1-atrajeev@linux.vnet.ibm.com>
References: <20231009050052.64935-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: maddy@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>, kjain@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 9 Oct 2023 10:30:52 +0530, Athira Rajeev wrote:
> Simple expression parser test fails in powerpc as below:
> 
>     4: Simple expression parser
>     test child forked, pid 170385
>     Using CPUID 004e2102
>     division by zero
>     syntax error
>     syntax error
>     FAILED tests/expr.c:65 parse test failed
>     test child finished with -1
>     Simple expression parser: FAILED!
> 
> [...]

Applied to perf-tools-next, thanks!

