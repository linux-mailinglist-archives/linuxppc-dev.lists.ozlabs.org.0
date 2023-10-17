Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B94157CCCB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:56:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WvhT+81J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S94Vh4xCPz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WvhT+81J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S94Tl2Gdjz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:55:38 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6bb4abb8100so2692626b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697572535; x=1698177335; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUfAT9j+UiGDkMtqjgkrEGPlSXxDKIe3u0fbK8YKgkE=;
        b=WvhT+81JRDpyKYX0BkigVZ9Txip7EAjZD2Dy2UZQpGJujXJFqAS2cyOCZXstIF2w98
         7d54fbzq1YvIEhTaPtbH29CPq7BvMtz8hy1nLa5/4Tj5cu9ZeASrijFHaOksH7gPdWfU
         sJrwtzPRPZCfwTSgdqeaurvbzhuHOlvkKMwgRxCDVpNHZw7QFMHLyIfRZyFYbhXehqcl
         vpkRgRU7TWfZB7ewepFVVOxMX7fGGuZIuptX8Cr7HXHw2AThe8DB5o39bCKqkeqIABHe
         l2f1Ivq0p3XSIl7Fyc1t4Ch2WR1rRMDsGCMw/hHDl6j7PSwRM/+oCnBym2s5jypoIuzn
         8MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697572535; x=1698177335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eUfAT9j+UiGDkMtqjgkrEGPlSXxDKIe3u0fbK8YKgkE=;
        b=aPSDBw+aIGC/u1W/N6eom05I9U0XTlzoiui7vXKmaq1zqrY89Ieu93CdlC5dhpb0Mt
         KdYS1+0zLDK6beY6DbevyAZcqOJREeYh0/jE1XCHOmAcfndIv2aShfe8zAGSyJ+ps/Uu
         0AJXlGOcyhBSEhnNy4r8nd9LPq0Y4LG241DzJInaq8ONyJlMuPUnDXOd/gzHAMqjw0IX
         M+WqJb1gLRGhXs5y1A/izwmp00yj3Z5gvVcIrXx6hzO8guwoyOvkG7Ok3wNwm3ad82ex
         E4jEHdLNGXB4jT1eHSXw1JQBsQHE9KY1k/KyjL1F5ed5Azsss3umqo1zdogBoowIKM+S
         N8xA==
X-Gm-Message-State: AOJu0YzgE8s7VJM3J7SpdDYA13sbqdzRwJxE2NCltB0LdoPVJc/rhAf0
	XLMEV1mxzNlEzKmeS12DJ0A=
X-Google-Smtp-Source: AGHT+IHpOTr5wIEIVlxb57lkDcxQShrj6O+3bGwiMbh9AQqBmlmlcAGpMNq6jgvSt6NG+sTZrnQKxg==
X-Received: by 2002:a05:6a00:1494:b0:68f:c865:5ba8 with SMTP id v20-20020a056a00149400b0068fc8655ba8mr3770474pfu.18.1697572535241;
        Tue, 17 Oct 2023 12:55:35 -0700 (PDT)
Received: from moohyul.svl.corp.google.com ([2620:15c:2a3:200:c77b:3fef:28e3:81d2])
        by smtp.gmail.com with ESMTPSA id a6-20020aa79706000000b0068fece2c190sm1848041pfg.70.2023.10.17.12.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:55:34 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	adrian.hunter@intel.com,
	irogers@google.com,
	jolsa@kernel.org,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 0/3] Fix for shellcheck issues with latest scripts in tests/shell
Date: Tue, 17 Oct 2023 12:55:27 -0700
Message-ID: <169757198796.167943.10552920255799914362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231013073021.99794-1-atrajeev@linux.vnet.ibm.com>
References: <20231013073021.99794-1-atrajeev@linux.vnet.ibm.com>
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

On Fri, 13 Oct 2023 13:00:18 +0530, Athira Rajeev wrote:
> shellcheck was run on perf tool shell scripts as a pre-requisite
> to include a build option for shellcheck discussed here:
> https://www.spinics.net/lists/linux-perf-users/msg25553.html
> 
> And fixes were added for the coding/formatting issues in
> two patchsets:
> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@linux.vnet.ibm.com/
> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@linux.vnet.ibm.com/
> 
> [...]

Applied to perf-tools-next, thanks!

