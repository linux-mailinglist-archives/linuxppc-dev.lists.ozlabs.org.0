Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8637C91ADD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 19:18:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=g47fC2Rp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W94zD752qz3dC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 03:18:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=g47fC2Rp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W94yX31Czz3cTw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 03:17:55 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-375bb80e5b8so3485ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719508668; x=1720113468; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsuX0TwL2xAavumghQ/V7F80KHhaFw7bJmljx1r1XKg=;
        b=g47fC2RpgvlfRDk6RY5es3RXpnCdXnX/E9NMPaXDaCK1TvseyMZ/oXqe2aTPldFcze
         7V6rX3y6WpcR8tem+b1sMqJzEaoN408uo06qEPxtE4CgvQqMXt6hwS3yZv4vRL0Tky8Q
         CdW23n4BqDJ0lcVn0yfITWJYpCv3L1+QNR401m5AmttD4fl90LTOW1n8X8K8wNCv9e2H
         AL1WRhImg+4yZevrQLkKOkT8tS4c5JN48R9V7ggdx4TXhGJ8nTy/yWGges5OgJe3P2Jt
         vEmQJlaD/T/RuVGh9F595dRvUb4poj1/IcVS+INyMdFXnhZaKRH8fF4nRPWWXK2v3vK0
         EpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508668; x=1720113468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsuX0TwL2xAavumghQ/V7F80KHhaFw7bJmljx1r1XKg=;
        b=DYT4nHwcjIISSJWKqxt/YFc8wbFQMXRoameGusvXkeGcYik1vWTgfjWAlomhREmmMc
         001Nxqk7cZEYh3vsY6ZrkaHGwLonwzE7jg0I71a/S4JkPxenNQyyF5EbhEPQgZ6wXrsA
         OE+PMXrpgT290ZJNyRM3fAb/ylgvGsteVmtGM8YxIkvhumhldrYntHCNboJ8sQVdIUK2
         qulK+EenD0Rz6kv3zKdochZ290qDO/Ktec/SOVs8cGQVukxrrq1mTSXJoAqxEnHPUGeZ
         31TJODvQYLGs79IKQwwfIHFoaSEch8x5G9QOZuVK4vNch1DaPx5sHAcmEJpJAvNd4VzT
         c4SQ==
X-Gm-Message-State: AOJu0YwEHASd1bkthcT666wkJV9FOO1DobIxIYzL51mZQcelzv/YZez3
	bNTg2zJmCENFOyBImSjkcJQIRnd7Ao4dQCRIOJFwla7DM1egJe0lKD6vTQX0hy6jIQ7upFrvNS3
	ZKxCWUdVv79cftguyJlJZhUKNAftNebufg6Gr
X-Google-Smtp-Source: AGHT+IGvAgYSYBE307LmnsDUtRzN58DFq1f8GNu4AQnc3KQ2F0CVbN+2P2lh1gtRMhbEOkJmZIB8Y5W99gnsBV9ZJwc=
X-Received: by 2002:a05:6e02:1b05:b0:376:38e3:634b with SMTP id
 e9e14a558f8ab-3795cb30446mr3980715ab.12.1719508667569; Thu, 27 Jun 2024
 10:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240627133743.407048-1-adubey@linux.ibm.com>
In-Reply-To: <20240627133743.407048-1-adubey@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 27 Jun 2024 10:17:36 -0700
Message-ID: <CAP-5=fWyDXFPi4Jn1PYTbVCRO_f_8gcp6aaB10=6CfqDdXgkLQ@mail.gmail.com>
Subject: Re: [PATCH] Perf: Calling available function for stats printing
To: Abhishek Dubey <adubey@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: mark.rutland@arm.com, peterz@infradead.org, adrian.hunter@intel.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, alexander.shishkin@linux.intel.com, mingo@redhat.com, jolsa@kernel.org, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, chu howard <howardchu95@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024 at 6:37=E2=80=AFAM Abhishek Dubey <adubey@linux.ibm.co=
m> wrote:
>
> For printing dump_trace, just use existing stats_print()
> function.
>
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>

Thanks Abishek, the change looks good but it needs to be rebased on
top of Commit 411ee13598ef ("perf hist: Add symbol_conf.skip_empty") -
https://lore.kernel.org/r/20240607202918.2357459-4-namhyung@kernel.org
. Recently Howard Chu wrote a guide on this:
https://sberm.cn/blog/how-to-contrib-perf

Another small issue is the commit message should be "perf report: ..."
rather than "Perf: ...".

Thanks,
Ian
