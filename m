Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EAA17C5E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 20:08:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yxvp6qQ3zDrCj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 06:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YxtM22nlzDr3V
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 06:06:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=N3fchBtW; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48YxtM14sBz8tFr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 06:06:35 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48YxtM0hLzz9sRN; Sat,  7 Mar 2020 06:06:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=209.85.215.171;
 helo=mail-pg1-f171.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=N3fchBtW; dkim-atps=neutral
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48YxtK03sVz9sPk
 for <linuxppc-dev@ozlabs.org>; Sat,  7 Mar 2020 06:06:32 +1100 (AEDT)
Received: by mail-pg1-f171.google.com with SMTP id s2so1502370pgv.6
 for <linuxppc-dev@ozlabs.org>; Fri, 06 Mar 2020 11:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2X+Ul309yZGpemZW/4lXZNwmO0GYSEg/Q2NePCfu2XA=;
 b=N3fchBtWqq2bQi+kOwvHnoCpc51mOmrLbnK5Pocm2soUauI9QBr5bjjzuIKhYD9qwk
 OJg/H/FG2peavfBR8nGEJVOJMnI7igEKKTRRDP1UvEI+anXZsH6FEyQxbjNUUT1LG6wr
 8hqA7yUGIMucNUOtu5fRAZvGDV/oQQJFO79njC+FAWsD5n6mVg5jaGkfzbmm21EQV9kS
 IHn3nwIXYA7mkHu5FgqQ9j5YMa/jdxB7qnUb2y+eMplzK8zFcphBo0BAix49KYmIjZSk
 ES5O7jyXLRByoe3C8sZU8xqLhk9bVbYzML9Q7x1JYX1yPgGufrEp/dpapWlIVSpKq0JZ
 k8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2X+Ul309yZGpemZW/4lXZNwmO0GYSEg/Q2NePCfu2XA=;
 b=SB8cVdlbiPuF+HJXBdFa9xI/jXKUMvbm9Ptx8gKNvPJbkxCtvgTK+s/HdEMQhvcNyY
 rmK8Q/ItV+e3zO084y+I9tk7cmLAWFJCIGxquztV8sE9z9MIC1BQJ334WbeyzUMnbS7M
 DE8QqwHNK48c1s7lS4gZ8mjLQpHAFNwkavUT31xbhYXIPgrwFdteC9oX0W7XnKccNJb6
 yugpMAurZ0s/QIL+NneijWZ2hzAzHQ/FJQySIsjU1c2BviEkqKGVhBPH+zXZai8UzNNb
 TVLr0c1uY59U9qGsiHJ+GOn87R4AnbRSmzIabxM3n6Do/xkZrXtJq4ozkOKpUbmz7pfI
 9GvQ==
X-Gm-Message-State: ANhLgQ22fVxFZlBrOqSb07zMyqIX5ePjsbDZcMU9X6DNGMTpx03EU2XE
 tdmPtfEnI/38RiNZ1Fz70PpFKk2z+o3ORIkB4LRkAA==
X-Google-Smtp-Source: ADFU+vsGBfsSEAggeHJmKXBcJEItBYAWfMgKZeucPmi5KAzc/aBSJh1PI6IBA6p07QEol5XViHGdb4omuDBIks5f12Y=
X-Received: by 2002:a63:4d6:: with SMTP id 205mr4599584pge.10.1583521529641;
 Fri, 06 Mar 2020 11:05:29 -0800 (PST)
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Mar 2020 11:05:18 -0800
Message-ID: <CAKwvOdk=eFqRqN0KO1en9wH-NhcvwXbx_ntmUtf8h_xZSd-qKw@mail.gmail.com>
Subject: ppc32 panic on boot on linux-next
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a heads up, our CI went red last night, seems like a panic from
free_initmem?  Is this a known issue?

https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/295304058?utm_medium=notification&utm_source=email

-- 
Thanks,
~Nick Desaulniers
