Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 528CB2D46BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 17:29:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrjDf1p7kzDqsj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 03:29:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1798 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Dec 2020 03:27:31 AEDT
Received: from 1.mo51.mail-out.ovh.net (1.mo51.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrjBW2ZyfzDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 03:27:30 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id EC44E241F14;
 Wed,  9 Dec 2020 16:50:02 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 16:50:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e8116bbe-5bcb-4c68-a341-4abf38e9f395,
 F89B705946B58AFC48376D7414C518838B559611) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 04/13] powerpc/xive: Use cpu_to_node() instead of ibm,
 chip-id property
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-5-clg@kaod.org> <877dpregp5.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b463f4df-2d06-2458-48bd-d0d11536e31f@kaod.org>
Date: Wed, 9 Dec 2020 16:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <877dpregp5.fsf@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 834042aa-cd81-4a42-bca5-ab4652333be1
X-Ovh-Tracer-Id: 17449759707509001114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeetfeejteefhfeuveethfduffeftdelvdeghfelhfeljeehheeuieevudeggefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghnvggvshhhrdhkuhhmrghrsehlihhnuhigrdhisghmrdgtohhm
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

On 12/9/20 5:39 AM, Aneesh Kumar K.V wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> The 'chip_id' field of the XIVE CPU structure is used to choose a
>> target for a source located on the same chip when possible. This field
>> is assigned on the PowerNV platform using the "ibm,chip-id" property
>> on pSeries under KVM when NUMA nodes are defined but it is undefined
>> under PowerVM. The XIVE source structure has a similar field
>> 'src_chip' which is only assigned on the PowerNV platform.
>>
>> cpu_to_node() returns a compatible value on all platforms, 0 being the
>> default node. It will also give us the opportunity to set the affinity
>> of a source on pSeries when we can localize them.
> 
> But we should avoid assuming that linux numa node number is equivalent
> to chip id [1]. 

Yes. the common layers should not make the (wrong) assumption on what a 
'node_id' represents and we should provide converting routines between 
both spaces, HW and logical. like we already have for CPUs, IRQ and other 
entities. 

'chip_id' needs a rename in some places under xive. This is the first 
patch in that direction.

cpu_to_node() gives the correct value on all platforms that need it today. 
Meaning : I don't know how to define nodes on PowerVM but it's not used 
in the XIVE layer under pseries.

> What do we expect this value represents on virtualized platforms like 
> PowerVM and KVM? 

on KVM, it's relatively simple to define a machine with numa nodes and 
devices (PHBs) attached to a specific node. The topology is correctly 
detected by Linux. If, under the hood, the HW topology matches the logical 
topology exposed to the VM, we should be able to tune affinity correctly
directly from the VM and have good results. 

But our drivers are not always doing the correct thing. IRQ and PCI MSIs 
will require some massaging.

I can not tell for PowerVM. I am still learning in that space.

> Is this used for a hcall?

Source configuration hcalls do not have any and this is one of the missing 
bits for interrupt affinity on pSeries. We have no direct ways to link a 
source with a node and to choose a suitable target. 

For PHB MSIs, we could deduce the node from the PHB. For other interrupts, 
we need hcall support, probably an extension of H_INT_GET_SOURCE_INFO
with a new flag to return a node id.



The XIVE interrupt controller adds extra complexity at the HW level because
interrupt routing depends on a set of tables which are allocated by the 
hypervisor. For best performance, these XIVE resources should be local to 
the chip which means that allocation for virtual CPUs and and virtual 
interrupts  should be defined carefully. that's the hypervisor business 
to have a good allocation strategy when defining virtual topologies.

 
> [1] https://lore.kernel.org/linuxppc-dev/20200817103238.158133-1-aneesh.kumar@linux.ibm.com

Isn't this trying to solve an issue when node 0 is missing ? 

Because on a 4 nodes system (with a node 0), sparse numbering is not a 
problem : 

# numactl -H 
available: 4 nodes (0,2,4,6)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107
node 0 size: 32269 MB
node 0 free: 29294 MB
node 2 cpus: 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195
node 2 size: 32447 MB
node 2 free: 31982 MB
node 4 cpus: 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267
node 4 size: 32489 MB
node 4 free: 31949 MB
node 6 cpus: 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351
node 6 size: 32427 MB
node 6 free: 32024 MB
node distances:
node   0   2   4   6 
  0:  10  40  40  40 
  2:  40  10  40  40 
  4:  40  40  10  40 
  6:  40  40  40  10 


>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/sysdev/xive/common.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index ee375daf8114..605238ca65e4 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -1342,16 +1342,11 @@ static int xive_prepare_cpu(unsigned int cpu)
>>  
>>  	xc = per_cpu(xive_cpu, cpu);
>>  	if (!xc) {
>> -		struct device_node *np;
>> -
>>  		xc = kzalloc_node(sizeof(struct xive_cpu),
>>  				  GFP_KERNEL, cpu_to_node(cpu));
>>  		if (!xc)
>>  			return -ENOMEM;
>> -		np = of_get_cpu_node(cpu, NULL);
>> -		if (np)
>> -			xc->chip_id = of_get_ibm_chip_id(np);
>> -		of_node_put(np);
>> +		xc->chip_id = cpu_to_node(cpu);
>>  		xc->hw_ipi = XIVE_BAD_IRQ;
>>  
>>  		per_cpu(xive_cpu, cpu) = xc;
>> -- 
>> 2.26.2

