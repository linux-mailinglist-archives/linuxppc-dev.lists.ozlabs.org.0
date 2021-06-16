Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6983AA584
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 22:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4xxM6FVzz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 06:44:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=hx3w=lk=kernel.crashing.org=segher@ozlabs.org;
 receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4xwy2JfSz308Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 06:43:45 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G4xwr6d7mz9sWD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 06:43:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G4xwr63dfz9sW6; Thu, 17 Jun 2021 06:43:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by ozlabs.org (Postfix) with ESMTP id 4G4xwr2VBTz9sSn;
 Thu, 17 Jun 2021 06:43:39 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 15GKgbDT025180;
 Wed, 16 Jun 2021 15:42:37 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 15GKgbaM025179;
 Wed, 16 Jun 2021 15:42:37 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 16 Jun 2021 15:42:36 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH 06/11] powerpc: microwatt: Use standard 16550 UART for
 console
Message-ID: <20210616204236.GL5077@gate.crashing.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMffx9iB13wRUvqz@thinks.paulus.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMffx9iB13wRUvqz@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 09:01:27AM +1000, Paul Mackerras wrote:
> This adds support to the Microwatt platform to use the standard
> 1655-style UART which available in the standalone Microwatt FPGA.

16550... 1655 is a DAC apparently :-)


Segher
