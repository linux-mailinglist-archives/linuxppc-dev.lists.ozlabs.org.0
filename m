Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C021D9222
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 15:13:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tXml4HjMzDqnR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 00:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b43;
 helo=mail-yb1-xb43.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5gyk7Qg"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tXh00w55zDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 00:09:35 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id h202so7753734ybg.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cJhS8Uvu8IS3lCqQrY8q+tdti+Cg6adXgBIoOdjb8V4=;
 b=m5gyk7QgJ8CIAvLxtX0CyUigPBUjOcWLC1k1mYzLbJCOEPzjZJJ16ZzcD6k4pAM/RP
 YMeE1ahe5XnjVOw5jkQpyoSd9oAfD7WRAuJ5/VeCyZKM+poz1C47V1YgZX56lWs7YhYA
 DQaC9VOcefoEL3qAMEnburd6OzkeRs9j/woC1ENNNTNoc5znE2eB8YwRzCsErvfI3uuq
 UG9i4Tr0fV5CzlkBVzpGnRsDsHW8q6+CnYUnqlOBP1wluGiZMf/F9NZ2SlqsLQeOjB7e
 fhkHTagnud5nzMM/sk6kZZJ/Gj3Y3HQ8PpOJbiG/fdfUmt3ThB8vBU0gKix51lhMpSn4
 4NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cJhS8Uvu8IS3lCqQrY8q+tdti+Cg6adXgBIoOdjb8V4=;
 b=tYV7g23fjKlNWJZiuUjPGXMkdJTjFxK1LTK/liF0fJMzPemxEdIMA26u6a3z79+q3j
 n8aoz9b6gxD5V+BGz3gfk6IKy44G41VYE2AGkle0Tu+eBR7o8U5NyMoVECxmWuwjUgS7
 xMkALfEcaXhVUGERojJ+hW2sH2VDDR1yX7xjax2/n9elSaFirXYuWomidk4qKAOeKb/7
 wJJe9DGcFgtOL2TkRtsKFk8qhYmOzrM5YmuRyPIFjOZ2XtXZ2eEwFSYqZ3Jo8CHLYgLH
 4TXaHsnsEWssFt1aWJzcEw2x6GfeSaE8VYRXlTG+SG4+GPva2iRPi2tF210kNfd162Co
 kBBw==
X-Gm-Message-State: APjAAAVgGn78NcoNC8unouODNgVkmnkAigRGF3tRZAIdXqpoqGpWSm7U
 /86hrL4LRHp8nzoYemK2yHAG9TKqUoITGFjwdjoUyS67
X-Google-Smtp-Source: APXvYqzZnIN4ZX7bdTfsZ28Y6EuLfL/GlPcjSI5l1Z0Ot31sjvO2jbICsutj4gvgO8kkyzR9S8DHhjCBANgBvQBCt0o=
X-Received: by 2002:a25:cdca:: with SMTP id d193mr27913342ybf.60.1571231371970; 
 Wed, 16 Oct 2019 06:09:31 -0700 (PDT)
MIME-Version: 1.0
From: Carlo Pisani <carlojpisani@gmail.com>
Date: Wed, 16 Oct 2019 15:09:19 +0200
Message-ID: <CA+QBN9AHoVFtgQL61oGk_i9ogNoSYsjrh6s4TQ2K1iwo-hju1g@mail.gmail.com>
Subject: Linux PowerPC, PPC4xx
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi
I am a student, I represent a group of friends running a couple of
opensource projects(1), and we are lost with this(2) problem.

I wrote here(2) a couple of years ago, we are still working with kernel
4.11.0 and there is broken support for initializing the PCI.

The PCI initialization of the PPC405GP seems wrong and every
kernel >= 2.6.26 is not able to correctly address the PDC20265

an interesting note is:
kernel 2.6.26 can be compiled with arch=ppc and arch=powerpc

when compiled with arch=ppc the promise PDC20265 chip is correctly
managed; while when compiled with arch=powerpc the PDC20265 is not
correctly managed

any idea? advice? help? suggestion?
a good place to discuss it?

thanks
Carlo

(1) http://www.downthebunker.com/reloaded/space/viewforum.php?f=37
(2) https://bugzilla.kernel.org/show_bug.cgi?id=195933
