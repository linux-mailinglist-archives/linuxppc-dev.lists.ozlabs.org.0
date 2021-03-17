Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8EC33F03F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 13:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0q8h21L9z3bvk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 23:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0q8N2H4lz30Bk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 23:24:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F0q8H4Kc9z9sWP; Wed, 17 Mar 2021 23:23:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, bhelgaas@google.com
In-Reply-To: <20210315214821.452959-1-tyreld@linux.ibm.com>
References: <20210315214821.452959-1-tyreld@linux.ibm.com>
Subject: Re: [PATCH v2] rpadlpar: fix potential drc_name corruption in store
 functions
Message-Id: <161598380341.805135.1994223786629407257.b4-ty@ellerman.id.au>
Date: Wed, 17 Mar 2021 23:23:23 +1100
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Mar 2021 15:48:21 -0600, Tyrel Datwyler wrote:
> Both add_slot_store() and remove_slot_store() try to fix up the drc_name
> copied from the store buffer by placing a NULL terminator at nbyte + 1
> or in place of a '\n' if present. However, the static buffer that we
> copy the drc_name data into is not zeored and can contain anything past
> the n-th byte. This is problematic if a '\n' byte appears in that buffer
> after nbytes and the string copied into the store buffer was not NULL
> terminated to start with as the strchr() search for a '\n' byte will mark
> this incorrectly as the end of the drc_name string resulting in a drc_name
> string that contains garbage data after the n-th byte. The following
> debugging shows an example of the drmgr utility writing "PHB 4543" to
> the add_slot sysfs attribute, but add_slot_store logging a corrupted
> string value.
> 
> [...]

Applied to powerpc/fixes.

[1/1] rpadlpar: fix potential drc_name corruption in store functions
      https://git.kernel.org/powerpc/c/cc7a0bb058b85ea03db87169c60c7cfdd5d34678

cheers
