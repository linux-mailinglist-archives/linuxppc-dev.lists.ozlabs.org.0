Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F241974A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 08:44:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rNHK0d2hzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 17:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--courbet.bounces.google.com
 (client-ip=2607:f8b0:4864:20::e49; helo=mail-vs1-xe49.google.com;
 envelope-from=35jsbxgckda8r396qt8v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--courbet.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=c0AtaP+c; dkim-atps=neutral
Received: from mail-vs1-xe49.google.com (mail-vs1-xe49.google.com
 [IPv6:2607:f8b0:4864:20::e49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rNF85JkhzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 17:42:48 +1100 (AEDT)
Received: by mail-vs1-xe49.google.com with SMTP id e8so1122984vsp.16
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
 bh=SgUhaM94KxHd0Ro08h1q71zQtInjXYe3MISrs1wOyi4=;
 b=c0AtaP+cLTXgLF+GMK/DsFjr00PagA4ARWCFyYD5/DlaLY11hN8VDg0DKAx+eqH0L5
 4bvlVzSInOv/nWOBqdLmxcfzrMpbFyqhj7a4uWHto3x6Kv/OBROj+ZqUAIvQqbUNKwOf
 DV5WS0qzgTZqtVAKGs6B1oc4hc3XiYyvzPmINcfcTvqP+VALX6nn4bLpJ92up9jL7cmD
 mqUb0Uiphqfo1zr196ZqPVrv/i4kZJ3OxbXoZuYLE7xzZb5ABI7yTYd54G1hmRlwIgGZ
 jjY9iJPReyTNsg3jEVHmzXZb8ngs9B+k0X5FLICrHc79CGH8pq1zpMQjr5B+SzKf2kRS
 VNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=SgUhaM94KxHd0Ro08h1q71zQtInjXYe3MISrs1wOyi4=;
 b=l73JguYUzgdKQMuHl9WPobeOc2BcXU4Jfku9WFV5+vQC4I7P7GwFFjOFXDtwDoDAII
 KrMRCGibNRsg1Fk8FDraGpVgA/hL0EhRem582FcOpJAKkBYpNMkCl4Ko06AidvJzWGE7
 Uq3i3nKYn0P6cN6ID3fzn1BUfFX53Sxfg/Asubg3P3ropKJaSNvmVXUKeUsxdf4IbYZK
 H+BKIIWa++FZgxB8HV6aoiOb+oXFyXLO6hTY9RkaFZof5prp/8NyvsARExXI2WcRsHdw
 O34J5geHTDBmwJP9bMGXxTtpPX5Mkm5p57pgg6j3P5u2aknEk7G9XEvZ/r8l6hsdwe28
 IyRA==
X-Gm-Message-State: AGi0PuZwj0dMay8dRbA0LZd/PgUG+0zDusQ2wy7j4S96VN3pIHmyDt6j
 057AXc/gNOGEG/m1ToQCI0Ud33eWY1RN
X-Google-Smtp-Source: APiQypLB65S/PY8B9J4Ak4AjFaL6BtHHrEGN5CiJKb6wEcLe1MP6P9YJq9uKtc2TkitLx67ssJ4fzAnwnYGA
X-Received: by 2002:a1f:d841:: with SMTP id p62mr6499884vkg.13.1585550564486; 
 Sun, 29 Mar 2020 23:42:44 -0700 (PDT)
Date: Mon, 30 Mar 2020 08:42:30 +0200
In-Reply-To: <20200327100801.161671-1-courbet@google.com>
Message-Id: <20200330064233.74407-1-courbet@google.com>
Mime-Version: 1.0
References: <20200327100801.161671-1-courbet@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v1] powerpc: Make setjmp/longjump signature standard
From: Clement Courbet <courbet@google.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Clement Courbet <courbet@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks you all for the comments. Everything addressed, plus the array vs
pointer suggestion from Segher Boessenkool on the other thread, which
is only cosmetic and does not change anything wrt behaviour.

