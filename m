Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2C1CB183
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:13:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JXPL5brnzDqP9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 00:13:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JWkn3xKRzDr6c
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 23:43:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=myzmSBT/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49JWkk2BXVz9sT2;
 Fri,  8 May 2020 23:43:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588945424;
 bh=p+YBkyP2GHp01pThlHZu2zNE3/neu24osdVU16EmOus=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=myzmSBT/czcoOa5b0uNfJvnSn0EcensBRxDGTXSXsFZHz7Ctw4cmolttivclZzczn
 TlU4xQX1sFeEGOftI9Vt/Yg7n9poabHDRrJD9dFFlDt9HOZEqTv21AH+l6TCSACJ+G
 LzS3HI2pTjb4HspWPolQxP9uBnlTFgDZQ6ylB+dBKG4qPpkcOlxszBgodBCGGUmAFz
 Q93GiXrPMyhMZQGgNOXOYLEcRd+vvVE96ReVfh9QW0MP4ysX2iPOSugJKl/xbhnJGC
 +t49vCyjdXj2x+CfQrmiPjxrxBDghm8z3dEzePmFlSG9Pl3oO4Ea39uGSlgu+ZudGZ
 ayiGjaAF21wwA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@alien8.de>, Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v7 2/5] seq_buf: Export seq_buf_printf() to external
 modules
In-Reply-To: <20200508113100.GA19436@zn.tnic>
References: <20200508104922.72565-1-vaibhav@linux.ibm.com>
 <20200508104922.72565-3-vaibhav@linux.ibm.com>
 <20200508113100.GA19436@zn.tnic>
Date: Fri, 08 May 2020 23:44:00 +1000
Message-ID: <875zd6czj3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Borislav Petkov <bp@alien8.de> writes:
> On Fri, May 08, 2020 at 04:19:19PM +0530, Vaibhav Jain wrote:
>> 'seq_buf' provides a very useful abstraction for writing to a string
>> buffer without needing to worry about it over-flowing. However even
>> though the API has been stable for couple of years now its stills not
>> exported to external modules limiting its usage.
>> 
>> Hence this patch proposes update to 'seq_buf.c' to mark
>> seq_buf_printf() which is part of the seq_buf API to be exported to
>> external GPL modules. This symbol will be used in later parts of this
>
> What is "external GPL modules"?

A module that has MODULE_LICENSE("GPL") ?

cheers
