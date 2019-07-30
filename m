Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A73227A6E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 13:27:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yZ6T3JwyzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 21:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yZ4W1clDzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 21:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45yZ4V3tzcz9s3Z;
 Tue, 30 Jul 2019 21:26:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Gibson <david@gibson.dropbear.id.au>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v5 2/4] powerpc/pseries: Update SCM hcall op-codes in
 hvcall.h
In-Reply-To: <20190726085300.GA4865@umbus>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-3-vaibhav@linux.ibm.com> <20190726085300.GA4865@umbus>
Date: Tue, 30 Jul 2019 21:26:01 +1000
Message-ID: <87ef27zrue.fsf@concordia.ellerman.id.au>
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:
> On Tue, Jul 23, 2019 at 09:43:55PM +0530, Vaibhav Jain wrote:
>> Update the hvcalls.h to include op-codes for new hcalls introduce to
>> manage SCM memory. Also update existing hcall definitions to reflect
>> current papr specification for SCM.
>> 
>> The removed hcall op-codes H_SCM_MEM_QUERY, H_SCM_BLOCK_CLEAR were
>> transient proposals and there support was never implemented by
>> Power-VM nor they were used anywhere in Linux kernel. Hence we don't
>> expect anyone to be impacted by this change.
>> 
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>
> They really should not have been merged while only interim proposals.
> But since they have changed, better to update them than not, obviously.

Yes, absolutely agree. It wasn't clear when I merged them that they were
*unpublished* and *unstable*.

Unfortunately we can't realistically wait for these APIs to be in a
published PAPR spec because it seems to take about 5 years for a PAPR
spec to escape the IBM firewall.

cheers
