Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DE29F936
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:43:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMhpJ3XMWzDqMb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMhhb1wJMzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 10:38:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CMhhb16NJz8tKT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 10:38:23 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CMhhZ6jldz9sSG; Fri, 30 Oct 2020 10:38:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=neutral (access neither permitted nor denied)
 smtp.mailfrom=russell.cc (client-ip=140.211.168.157; helo=fox;
 envelope-from=snowpatch@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Received: from fox (140-211-168-157-openstack.osuosl.org [140.211.168.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CMhhZ12qwz9sRk
 for <linuxppc-dev@ozlabs.org>; Fri, 30 Oct 2020 10:38:21 +1100 (AEDT)
Received: from fox (ip6-localhost [::1])
 by fox (OpenSMTPD) with ESMTP id 70ca9701;
 Thu, 29 Oct 2020 23:38:20 +0000 (UTC)
Subject: Test Results: RE: [V2,08/18] microblaze/mm/highmem: Switch to
 generic kmap atomic
To: "Thomas Gleixner" <tglx@linutronix.de>, <linuxppc-dev@ozlabs.org>
From: <snowpatch@russell.cc>
In-Reply-To: <20201029222651.395482379@linutronix.de>
Date: Thu, 29 Oct 2020 23:38:20 -0000
MIME-Version: 1.0
Message-ID: <4df71972-7c3f-4da6-84a4-e9e720cabe18.lettre@localhost>
Content-Type: multipart/mixed; boundary=mR9r1Ilx1pkm1LV5sQ0YqLuoUNCB51
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


--mR9r1Ilx1pkm1LV5sQ0YqLuoUNCB51
Content-Type: text/plain; charset=utf-8

Thanks for your contribution, unfortunately we've found some issues.

Your patch failed to apply to any branch.



--mR9r1Ilx1pkm1LV5sQ0YqLuoUNCB51--

