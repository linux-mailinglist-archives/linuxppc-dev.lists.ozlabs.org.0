Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B1BA98D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 05:17:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P5Tc5ytWzDr0w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 13:17:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P5R311MhzDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 13:15:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46P5R23b5zz9sDB; Thu,  5 Sep 2019 13:15:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46P5R15544z9s3Z;
 Thu,  5 Sep 2019 13:15:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v5 19/31] powerpc/fadump: Update documentation about OPAL
 platform support
In-Reply-To: <CAOSf1CEnhfT5n3sZBiuVM8k8_VTYaoDrSVy3dS-8Tb=pZTQTXw@mail.gmail.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630278711.8896.9799921270260662672.stgit@hbathini.in.ibm.com>
 <87y2z4p9dh.fsf@mpe.ellerman.id.au>
 <CAOSf1CEnhfT5n3sZBiuVM8k8_VTYaoDrSVy3dS-8Tb=pZTQTXw@mail.gmail.com>
Date: Thu, 05 Sep 2019 13:15:09 +1000
Message-ID: <87h85rph6q.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Wed, Sep 4, 2019 at 9:51 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Hari Bathini <hbathini@linux.ibm.com> writes:
...
>> > diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
>> > index d912755..2c3342c 100644
>> > --- a/Documentation/powerpc/firmware-assisted-dump.rst
>> > +++ b/Documentation/powerpc/firmware-assisted-dump.rst
>> > @@ -96,7 +97,9 @@ as follows:
>> >
>> >  Please note that the firmware-assisted dump feature
>> >  is only available on Power6 and above systems with recent
>> > -firmware versions.
>>
>> Notice how "recent" has bit rotted.
>>
>> > +firmware versions on PSeries (PowerVM) platform and Power9
>> > +and above systems with recent firmware versions on PowerNV
>> > +(OPAL) platform.
>>
>> Can we say something more helpful here, ie. "recent" is not very useful.
>> AFAIK it's actually wrong, there isn't a released firmware with the
>> support yet at all, right?
>>
>> Given all the relevant firmware is open source can't we at least point
>> to a commit or release tag or something?
>
> Even if we can quote a git sha it's not terrible useful or user
> friendly. We already gate the feature behind DT nodes / properties
> existing, so why not just say "fadump requires XYZ firmware feature,
> as indicated by <ABC> device-tree property."

But how does that help someone who's got a Talos/Blackbird and wants to
test this stuff?

cheers
