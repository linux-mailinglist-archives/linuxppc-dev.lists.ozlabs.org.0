Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D736CB6F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 08:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm02b4pXDz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 17:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mariadb.org header.i=@mariadb.org header.a=rsa-sha256 header.s=google header.b=dyb/icUW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mariadb.org (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=daniel@mariadb.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mariadb.org header.i=@mariadb.org header.a=rsa-sha256 header.s=google header.b=dyb/icUW;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm01g5y6Yz3cLs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 17:21:10 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id y2so7215664pfw.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mariadb.org; s=google; t=1679984467;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=swWEuE1XL58nNMtYxG2awpmv6qwrpTvJfaGKwtzc5Ko=;
        b=dyb/icUWpfVCrHB1T9B87DpVcAfk4JaOwiHNmEpHqC9SCfT02Ub9y1jB836BPXLs1X
         9iOMBez+sq7oxRKhiK4eV8hdcklFZxlD0FhfgHcFJyTeCw6SsWOsXq6MFbC7vXEX4HzA
         VndmHErHHBXJW0+Nkbg1rPZIQrj8n9Ti7OIewK0YAFoMCRV6XsR9QL6Lq7l4f6vKs56g
         c4u0m5o9dSbPN+7qJnV0biiYQf1Flz0qQQsVMge5BNoWYH7WWdfnwMaGI9TrTCx/SpM1
         weAKLD4Goa/W9IvZAdNfmLpt0Q5ZU1WrbvIJrffMVl+P0tQGTMn9/c7qk3xutOyKdnKr
         9Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679984467;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swWEuE1XL58nNMtYxG2awpmv6qwrpTvJfaGKwtzc5Ko=;
        b=OMCe4iY+TD8d8EIpuVa+SjJgDAswkM/fX9CLnAtlh0zn7jHntY3RKehiSPybfik06F
         Z4fNLmGHtUuxq3uN34sU7kgkN8UEh1mItjzYvblkNxBc5hinRtY7Tuv12krcal6ds61a
         vx3p6ZkbUsfONBQnuwFsLlIYK06Sf2n1ULG93r5ItqBZ4rCKMX6/1oIX9mR3/NGvgs7x
         NnlAg/JUji8yJCEAgbMNOyZxXbSD7y56UDJ2DgzGtGcj5HznECSgvo0pVyye4cgsSoX8
         1z3oVz1db3iqkvvNba6Nalsy1+O0QcKGd/Rkyd004I7iPpGh2/qYSkAtubmTMkmU3/WX
         1Fxw==
X-Gm-Message-State: AAQBX9d8uWMj4QEbFmrfVpzCBdmFd/LubUq+y7ZCR/jtS0lk0ND5xVpx
	mIUqSgIWrnkM3sKvkq8N3SDs9+/GWlV/2lsSD4qgOB8oStXLgBguRFk=
X-Google-Smtp-Source: AKy350YN39xxyYITi/VWQ3nDjqfvG74jMhLoQCmdeK715gTYU00q+ndI4SR5IbRIeb8iLkK+qskOjPfePqlKYk1UxE8=
X-Received: by 2002:a63:e005:0:b0:50b:d724:98e3 with SMTP id
 e5-20020a63e005000000b0050bd72498e3mr3698179pgh.0.1679984467312; Mon, 27 Mar
 2023 23:21:07 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Black <daniel@mariadb.org>
Date: Tue, 28 Mar 2023 17:20:56 +1100
Message-ID: <CABVffEN2=G3nFyk12qwWwtk6ZZiXoNquXUJ_oYTKa0q2=GE76Q@mail.gmail.com>
Subject: Memory coherency issue with IO thread offloading?
To: linuxppc-dev@lists.ozlabs.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Jens, Nick, Christophe and Michael for your work so far.

Apologies for the out of thread email.

Confirming MariabD-10.6+ is required( when we added liburing), and
previous versions used libaio (which tested without incident as mpe
retested).

We were (we're now back on the old good kernel Jens indicated) getting
failures like https://buildbot.mariadb.org/#/builders/231/builds/16857
in a container (of various distro userspaces) on bare metal.

bare metal end of /proc/cpuinfo

processor    : 127
cpu        : POWER9, altivec supported
clock        : 3283.000000MHz
revision    : 2.2 (pvr 004e 1202)

timebase    : 512000000
platform    : PowerNV
model        : 9006-22P
machine        : PowerNV 9006-22P
firmware    : OPAL
MMU        : Radix
