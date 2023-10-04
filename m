Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284747B774C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 07:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0jF80ylQz3vXQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 16:00:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0jDb4Tm7z30fD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 16:00:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S0jDM5gY6z4xQT;
	Wed,  4 Oct 2023 16:00:03 +1100 (AEDT)
Date: Wed, 04 Oct 2023 16:00:02 +1100
From: Michael Ellerman <michael@ellerman.id.au>
To: Jonathan Corbet <corbet@lwn.net>, Costa Shulyupin <costa.shul@redhat.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Yanteng Si <siyanteng@loongson.cn>, Heiko Carstens <hca@linux.ibm.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>,
 Benjamin Gray <bgray@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Rohan McLure <rmclure@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 Laurent Dufour <laurent.dufour@fr.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] docs: move powerpc under arch
User-Agent: K-9 Mail for Android
In-Reply-To: <87cyxvelnn.fsf@meer.lwn.net>
References: <169052340516.4355.10339828466636149348@legolas.ozlabs.org> <20230826165737.2101199-1-costa.shul@redhat.com> <87cyxvelnn.fsf@meer.lwn.net>
Message-ID: <46705070-17B2-4BDA-9524-1BB2F7BDBACA@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On October 4, 2023 3:05:48 AM GMT+11:00, Jonathan Corbet <corbet@lwn=2Enet=
> wrote:
>Costa Shulyupin <costa=2Eshul@redhat=2Ecom> writes:
>
>> and fix all in-tree references=2E
>>
>> Architecture-specific documentation is being moved into Documentation/a=
rch/
>> as a way of cleaning up the top-level documentation directory and makin=
g
>> the docs hierarchy more closely match the source hierarchy=2E
>>
>> Signed-off-by: Costa Shulyupin <costa=2Eshul@redhat=2Ecom>
>
>So this patch appears to have not been picked up, and to have received
>no comments=2E  I'll happily carry it in docs-next, but it would be nice
>to have an ack from the powerpc folks=2E=2E=2E?

I acked it a few months back, and said I assumed you were merging it:

https://lore=2Ekernel=2Eorg/linuxppc-dev/87bkfwem93=2Efsf@mail=2Elhotse/

I don't mind who merges it, I figured you merging it would generate fewer =
conflicts, but I'm happy to take it if you think that would be better=2E

Anyway here's another:

Acked-by: Michael Ellerman <mpe@ellerman=2Eid=2Eau> (powerpc)

cheers
--=20
Sent from my Android phone with K-9 Mail=2E Please excuse my brevity=2E
