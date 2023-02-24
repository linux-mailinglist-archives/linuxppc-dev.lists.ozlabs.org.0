Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 164346A14E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 03:26:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNDK305rXz3fSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 13:25:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNDHt6knJz3cf1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 13:24:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PNDHr4qdzz4x7x;
	Fri, 24 Feb 2023 13:24:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230222021708.146257-1-ruscur@russell.cc>
References: <20230222021708.146257-1-ruscur@russell.cc>
Subject: Re: [PATCH] powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries
Message-Id: <167720547610.3316778.8799511277356647963.b4-ty@ellerman.id.au>
Date: Fri, 24 Feb 2023 13:24:36 +1100
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
Cc: Murphy Zhou <jencce.kernel@gmail.com>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Feb 2023 13:17:08 +1100, Russell Currey wrote:
> plpks_is_available() can be called on any platform via kexec but calls
> _plpks_get_config() which makes a hcall, which will only work on pseries.
> Fix this by returning early in plpks_is_available() if hcalls aren't
> possible.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries
      https://git.kernel.org/powerpc/c/f82cdc37c4bd4ba905bf99ade9782a639b5c12e9

cheers
