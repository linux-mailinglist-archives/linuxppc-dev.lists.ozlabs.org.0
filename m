Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E032B112221
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 05:37:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SQzx1T2rzDqST
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 15:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=anastas.io (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="RX2KsrOy"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SQw83ff5zDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 15:33:44 +1100 (AEDT)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 9CFD77F435;
 Tue,  3 Dec 2019 17:45:53 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1575416754; bh=mdtQhN24kYvuo/KKla+16YACVSx83u/SxcWjz3GMu8E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RX2KsrOyELqDyJKEfd8W1Ers5uUuvDUvvfYAFg6XgbIbA6Dckey5KVjDPF74PcUBQ
 NrHiAQZXIghL9EKTMP07O+k0eb/vwAr1tssHj22vWiosLf69W7T4EwTVX9piAEMtVP
 228LLnFgFxu0x4csQBxyuCDhkpFh/eZjtXIgvNrZUHw6Ips2d5QybFhqXfH2NQI5AW
 3RwRGMpBvyTTJRvNg1aABPio/OZ0n6+jED1XJr6MGrAw/JbsfWdH91f2dUhmehhqFF
 S2fBn2luLsnpXlEz/fB6vo4IH6DqHC9NkZ004KLil1717rrwCcntluSekIf6RdjDss
 Nukga9XSlvFIA==
Subject: Re: [PATCH v2 1/3] powernv/iov: Ensure the pdn for VFs always
 contains a valid PE number
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191028085424.12006-1-oohall@gmail.com>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <166b9ee3-08fe-e558-b6a3-4ea5d9b9219f@anastas.io>
Date: Tue, 3 Dec 2019 17:45:51 -0600
MIME-Version: 1.0
In-Reply-To: <20191028085424.12006-1-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/28/19 3:54 AM, Oliver O'Halloran wrote:
> On pseries there is a bug with adding hotplugged devices to an IOMMU group.
> For a number of dumb reasons fixing that bug first requires re-working how
> VFs are configured on PowerNV.

Are these patches expected to land soon, or is there another fix in the
pipeline? As far as I can tell this is still an issue.
